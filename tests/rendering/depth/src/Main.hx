
import luxe.Sprite;
import luxe.Vector;
import luxe.Input;
import luxe.Color;
import phoenix.Texture;

class Main extends luxe.Game {


    var sprites : Array<Sprite>;
    var image : Texture;
    var image2 : Texture;

    override function ready() {

        image = Luxe.loadTexture('assets/image.jpg');

            //wait for images to load first
        image.onload = function(_) {
            image2 = Luxe.loadTexture('assets/luxe.png');
            image2.onload = function(_) {
                create();
            }
        }

    } //ready

    function create() {
        sprites = [];

        for(i in 1 ... 20) {

            var ih = image.height;
            var iw = image.width;

            if(i == 1) {
                iw = image2.width;
                ih = image2.height;
            }

            sprites.push(new Sprite({
                name : 's' + i,
                depth : i,
                texture: (i == 1) ? image2 : image,
                centered : false,
                color : (i == 1) ? new Color() : new Color(Math.random(), Math.random(), Math.random()),
                pos : new Vector(100 + (i*20), 100 + (i*20) ),
                size : new Vector(iw*0.2,ih*0.2)
            }));

        } //for loop
    }

    override function onmousemove( e:MouseEvent ) {

        sprites[0].pos = e.pos;

    } //onmousemove

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        if(e.keycode == Key.space) {
            var d= sprites[0].depth;
            sprites[0].depth = d;
        }

        if(e.keycode == Key.equals) {
            sprites[0].depth+=1;
            trace(sprites[0].depth);
        }

        if(e.keycode == Key.minus) {
            sprites[0].depth-=1;
            trace(sprites[0].depth);
        }

    } //onkeyup


} //Main
