package eclothing

import org.springframework.dao.DataIntegrityViolationException

class ItempedidoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [itempedidoInstanceList: Itempedido.list(params), itempedidoInstanceTotal: Itempedido.count()]
    }

    def create() {
        [itempedidoInstance: new Itempedido(params)]
    }

    def save() {
        def itempedidoInstance = new Itempedido(params)
        if (!itempedidoInstance.save(flush: true)) {
            render(view: "create", model: [itempedidoInstance: itempedidoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), itempedidoInstance.id])
        redirect(action: "show", id: itempedidoInstance.id)
    }

    def show(Long id) {
        def itempedidoInstance = Itempedido.get(id)
        if (!itempedidoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), id])
            redirect(action: "list")
            return
        }

        [itempedidoInstance: itempedidoInstance]
    }

    def edit(Long id) {
        def itempedidoInstance = Itempedido.get(id)
        if (!itempedidoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), id])
            redirect(action: "list")
            return
        }

        [itempedidoInstance: itempedidoInstance]
    }

    def update(Long id, Long version) {
        def itempedidoInstance = Itempedido.get(id)
        if (!itempedidoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (itempedidoInstance.version > version) {
                itempedidoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'itempedido.label', default: 'Itempedido')] as Object[],
                          "Another user has updated this Itempedido while you were editing")
                render(view: "edit", model: [itempedidoInstance: itempedidoInstance])
                return
            }
        }

        itempedidoInstance.properties = params

        if (!itempedidoInstance.save(flush: true)) {
            render(view: "edit", model: [itempedidoInstance: itempedidoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), itempedidoInstance.id])
        redirect(action: "show", id: itempedidoInstance.id)
    }

    def delete(Long id) {
        def itempedidoInstance = Itempedido.get(id)
        if (!itempedidoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), id])
            redirect(action: "list")
            return
        }

        try {
            itempedidoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'itempedido.label', default: 'Itempedido'), id])
            redirect(action: "show", id: id)
        }
    }
}
