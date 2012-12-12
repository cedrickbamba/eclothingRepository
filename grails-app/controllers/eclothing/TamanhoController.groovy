package eclothing

import org.springframework.dao.DataIntegrityViolationException

class TamanhoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tamanhoInstanceList: Tamanho.list(params), tamanhoInstanceTotal: Tamanho.count()]
    }

    def create() {
        [tamanhoInstance: new Tamanho(params)]
    }

    def save() {
        def tamanhoInstance = new Tamanho(params)
        if (!tamanhoInstance.save(flush: true)) {
            render(view: "create", model: [tamanhoInstance: tamanhoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), tamanhoInstance.id])
        redirect(action: "show", id: tamanhoInstance.id)
    }

    def show(Long id) {
        def tamanhoInstance = Tamanho.get(id)
        if (!tamanhoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), id])
            redirect(action: "list")
            return
        }

        [tamanhoInstance: tamanhoInstance]
    }

    def edit(Long id) {
        def tamanhoInstance = Tamanho.get(id)
        if (!tamanhoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), id])
            redirect(action: "list")
            return
        }

        [tamanhoInstance: tamanhoInstance]
    }

    def update(Long id, Long version) {
        def tamanhoInstance = Tamanho.get(id)
        if (!tamanhoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tamanhoInstance.version > version) {
                tamanhoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tamanho.label', default: 'Tamanho')] as Object[],
                          "Another user has updated this Tamanho while you were editing")
                render(view: "edit", model: [tamanhoInstance: tamanhoInstance])
                return
            }
        }

        tamanhoInstance.properties = params

        if (!tamanhoInstance.save(flush: true)) {
            render(view: "edit", model: [tamanhoInstance: tamanhoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), tamanhoInstance.id])
        redirect(action: "show", id: tamanhoInstance.id)
    }

    def delete(Long id) {
        def tamanhoInstance = Tamanho.get(id)
        if (!tamanhoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), id])
            redirect(action: "list")
            return
        }

        try {
            tamanhoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tamanho.label', default: 'Tamanho'), id])
            redirect(action: "show", id: id)
        }
    }
}
