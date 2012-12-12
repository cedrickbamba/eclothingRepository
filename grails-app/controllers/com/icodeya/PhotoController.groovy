package com.icodeya

import org.springframework.dao.DataIntegrityViolationException


class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

	def displayPhoto(){
		def photo = Photo.get(params.id)
		
		if(photo){
		response.contentType = "image/jpeg"
		response.contentLength = photo?.photo?.length
		response.outputStream.write(photo?.photo)
		}
	}
		
	def showPhotoGallery(){
		params.max = Math.min(params.max ? params.int('max') : 100, 100)
		render(view:"photoGallery",model:[photos: Photo.list(params)])
	}
	
	/* Funções para categorias de roupas*/
	
	def showPhotoGalleryFeminino(){
		params.max = Math.min(params.max ? params.int('max') : 100, 100)
		render(view:"feminino",model:[photos: Photo.list(params)])
	}
	
	def showPhotoGalleryMasculino(){
		params.max = Math.min(params.max ? params.int('max') : 100, 100)
		render(view:"masculino",model:[photos: Photo.list(params)])
	}
	
	def showPhotoGalleryInfantil(){
		params.max = Math.min(params.max ? params.int('max') : 100, 100)
		render(view:"infantil",model:[photos: Photo.list(params)])
	}
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [photoInstanceList: Photo.list(params), photoInstanceTotal: Photo.count()]
    }

    def create() {
        [photoInstance: new Photo(params)]
    }

    def save() {
        def photoInstance = new Photo(params)
        if (!photoInstance.save(flush: true)) {
            render(view: "create", model: [photoInstance: photoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }

    def show(Long id) {
        def photoInstance = Photo.get(id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def edit(Long id) {
        def photoInstance = Photo.get(id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), id])
            redirect(action: "list")
            return
        }

        [photoInstance: photoInstance]
    }

    def update(Long id, Long version) {
        def photoInstance = Photo.get(id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (photoInstance.version > version) {
                photoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'photo.label', default: 'Photo')] as Object[],
                          "Another user has updated this Photo while you were editing")
                render(view: "edit", model: [photoInstance: photoInstance])
                return
            }
        }

        photoInstance.properties = params

        if (!photoInstance.save(flush: true)) {
            render(view: "edit", model: [photoInstance: photoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'photo.label', default: 'Photo'), photoInstance.id])
        redirect(action: "show", id: photoInstance.id)
    }

    def delete(Long id) {
        def photoInstance = Photo.get(id)
        if (!photoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'photo.label', default: 'Photo'), id])
            redirect(action: "list")
            return
        }

        try {
            photoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'photo.label', default: 'Photo'), id])
            redirect(action: "show", id: id)
        }
    }
}
