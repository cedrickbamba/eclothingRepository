package eclothing



import org.junit.*
import grails.test.mixin.*

@TestFor(ItempedidoController)
@Mock(Itempedido)
class ItempedidoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/itempedido/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.itempedidoInstanceList.size() == 0
        assert model.itempedidoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.itempedidoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.itempedidoInstance != null
        assert view == '/itempedido/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/itempedido/show/1'
        assert controller.flash.message != null
        assert Itempedido.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/itempedido/list'

        populateValidParams(params)
        def itempedido = new Itempedido(params)

        assert itempedido.save() != null

        params.id = itempedido.id

        def model = controller.show()

        assert model.itempedidoInstance == itempedido
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/itempedido/list'

        populateValidParams(params)
        def itempedido = new Itempedido(params)

        assert itempedido.save() != null

        params.id = itempedido.id

        def model = controller.edit()

        assert model.itempedidoInstance == itempedido
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/itempedido/list'

        response.reset()

        populateValidParams(params)
        def itempedido = new Itempedido(params)

        assert itempedido.save() != null

        // test invalid parameters in update
        params.id = itempedido.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/itempedido/edit"
        assert model.itempedidoInstance != null

        itempedido.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/itempedido/show/$itempedido.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        itempedido.clearErrors()

        populateValidParams(params)
        params.id = itempedido.id
        params.version = -1
        controller.update()

        assert view == "/itempedido/edit"
        assert model.itempedidoInstance != null
        assert model.itempedidoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/itempedido/list'

        response.reset()

        populateValidParams(params)
        def itempedido = new Itempedido(params)

        assert itempedido.save() != null
        assert Itempedido.count() == 1

        params.id = itempedido.id

        controller.delete()

        assert Itempedido.count() == 0
        assert Itempedido.get(itempedido.id) == null
        assert response.redirectedUrl == '/itempedido/list'
    }
}
