$port=9999
$IPendpoint = new-object System.Net.IPEndPoint ([system.net.ipaddress]::any, $port)
$listener = new-object System.Net.Sockets.TcpListener $IPendpoint
$listener.start()
$client = $listener.AcceptTcpClient()