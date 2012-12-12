package eclothing



import org.junit.*
import grails.test.mixin.*

@TestFor(TamanhoController)
@Mock(Tamanho)
class TamanhoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tamanho/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tamanhoInstanceList.size() == 0
        assert model.tamanhoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.tamanhoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tamanhoInstance != null
        assert view == '/tamanho/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tamanho/show/1'
        assert controller.flash.message != null
        assert Tamanho.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tamanho/list'

        populateValidParams(params)
        def tamanho = new Tamanho(params)

        assert tamanho.save() != null

        params.id = tamanho.id

        def model = controller.show()

        assert model.tamanhoInstance == tamanho
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tamanho/list'

        populateValidParams(params)
        def tamanho = new Tamanho(params)

        assert tamanho.save() != null

        params.id = tamanho.id

        def model = controller.edit()

        assert model.tamanhoInstance == tamanho
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tamanho/list'

        response.reset()

        populateValidParams(params)
        def tamanho = new Tamanho(params)

        assert tamanho.save() != null

        // test invalid parameters in update
        params.id = tamanho.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tamanho/edit"
        assert model.tamanhoInstance != null

        tamanho.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tamanho/show/$tamanho.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tamanho.clearErrors()

        populateValidParams(params)
        params.id = tamanho.id
        params.version = -1
        controller.update()

        assert view == "/tamanho/edit"
        assert model.tamanhoInstance != null
        assert model.tamanhoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tamanho/list'

        response.reset()

        populateValidParams(params)
        def tamanho = new Tamanho(params)

        assert tamanho.save() != null
        assert Tamanho.count() == 1

        params.id = tamanho.id

        controller.delete()

        assert Tamanho.count() == 0
        assert Tamanho.get(tamanho.id) == null
        assert response.redirectedUrl == '/tamanho/list'
    }
}
