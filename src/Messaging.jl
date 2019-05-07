module Messaging

using Serialization, Base64, ZMQ

export pub, sub, initpub, initsub

function send2zmq(sock::Socket, obj)
    buff = IOBuffer()
    serialize(buff, obj)
    data = copy(buff.data)
    send(sock, base64encode(data))
end

function recvfromzmq(sock::Socket)
    data = recv(sock, String)
    buff = IOBuffer(base64decode(data))
    deserialize(buff)
end

pubsock = Socket(PUB)
subsock = Socket(SUB)

pub(obj) = send2zmq(pubsock, obj)
sub() = recvfromzmq(subsock)

function initpub()
    bind(pubsock, "tcp://*:5555")
end

function initsub()
    subscribe(subsock, "")
    connect(subsock, "tcp://localhost:5555")
end

end