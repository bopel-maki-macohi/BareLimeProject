class RenderQueue
{
	public static var renders(default, null):Array<Render> = [];

	public static var requests(default, null):Array<Void->Render> = [];

	public static function addRequest(request:Void->Render)
	{
		requests.push(request);
	}

	public static function clear()
	{
		renders = [];
	}

	public static function request()
	{
		for (request in requests)
		{
			if (request == null)
			{
				requests.remove(request);
				continue;
			}

			var renderPiece:Render = request();

			if (renderPiece != null)
				renders.push(renderPiece);
		}
	}
}
