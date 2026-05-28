class RenderQueue
{
	public static var renders(default, null):Array<Dynamic> = [];

	public static var requests(default, null):Array<Void->Void> = [];

	public static function addRequest(request:Void->Void)
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

			request();
		}
	}
}
