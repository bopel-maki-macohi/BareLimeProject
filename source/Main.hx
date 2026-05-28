package;

import lime.app.Application;
import lime.graphics.RenderContext;

class Main extends Application
{
	public function new()
	{
		super();

		RenderQueue.addRequest(defaultRender);
	}

	function defaultRender():Render
	{
		return {
			x: 0,
			y: 0,
			width: window.width,
			height: window.height,
			color: 0xBFFF00,
		}
	}

	override function onWindowCreate()
	{
		super.onWindowCreate();

		/**
		 * windows - opengl
		 * html5 - webgl
		 */
		trace(window.context.type);
	}

	public override function render(context:RenderContext):Void
	{
		RenderQueue.clear();
		RenderQueue.request();

		switch (context.type)
		{
			case CAIRO:
				var cairo = context.cairo;

				cairo.setSourceRGB(0.75, 1, 0);
				cairo.paint();

			case CANVAS:
				var ctx = context.canvas2D;

				ctx.fillStyle = "#BFFF00";
				ctx.fillRect(0, 0, window.width, window.height);

			case DOM:
				var element = context.dom;

				element.style.backgroundColor = "#BFFF00";

			// (not lime_doc_gen) or flash
			case FLASH:
				var sprite = context.flash;

				sprite.graphics.beginFill(0xBFFF00);
				sprite.graphics.drawRect(0, 0, window.width, window.height);

			case OPENGL, OPENGLES, WEBGL:
				var gl = context.webgl;

				gl.clearColor(0.75, 1, 0, 1);
				gl.clear(gl.COLOR_BUFFER_BIT);

			default:
		}
	}
}
