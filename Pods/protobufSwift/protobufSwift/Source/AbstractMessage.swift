// Protocol Buffers for Swift
//
// Copyright 2014 Alexey Khohklov(AlexeyXo).
// Copyright 2008 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License")
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation


public typealias ONEOF_NOT_SET = Int

public protocol ProtocolBuffersMessageInit {
}

public enum ProtocolBuffersError: Error {
    case obvious(String)
    //Streams
    case invalidProtocolBuffer(String)
    case illegalState(String)
    case illegalArgument(String)
    case outOfSpace
}

public protocol ProtocolBuffersMessage:ProtocolBuffersMessageInit {
    var unknownFields:UnknownFieldSet{get}
    func serializedSize() -> Int32
    func isInitialized() -> Bool
    func writeTo(codedOutputStream:CodedOutputStream) throws
    func writeTo(outputStream:OutputStream) throws
    func data() throws -> Data
    static func classBuilder()-> ProtocolBuffersMessageBuilder
    func classBuilder()-> ProtocolBuffersMessageBuilder
    
}

public protocol ProtocolBuffersMessageBuilder {
     var unknownFields:UnknownFieldSet{get set}
     func clear() -> Self
     func isInitialized()-> Bool
     func build() throws -> AbstractProtocolBuffersMessage
     func merge(unknownField:UnknownFieldSet) throws -> Self
     func mergeFrom(codedInputStream:CodedInputStream) throws ->  Self
     func mergeFrom(codedInputStream:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Self
     func mergeFrom(data:Data) throws -> Self
     func mergeFrom(data:Data, extensionRegistry:ExtensionRegistry) throws -> Self
     func mergeFrom(inputStream:InputStream) throws -> Self
     func mergeFrom(inputStream:InputStream, extensionRegistry:ExtensionRegistry) throws -> Self
     //Delimited Encoding/Decoding
     func mergeDelimitedFrom(inputStream:InputStream) throws -> Self?
}

public func == (lhs: AbstractProtocolBuffersMessage, rhs: AbstractProtocolBuffersMessage) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
open class AbstractProtocolBuffersMessage:Hashable, ProtocolBuffersMessage {
    
    public var unknownFields:UnknownFieldSet
    required public init() {
        unknownFields = UnknownFieldSet(fields: Dictionary())
    }

    final public func data() -> Data {
        let ser_size = serializedSize()
        let data = Data(count: Int(ser_size))
        let stream:CodedOutputStream = CodedOutputStream(data: data)
        do {
            try writeTo(codedOutputStream: stream)
        }
        catch {}
        return stream.buffer.buffer
    }
    open func isInitialized() -> Bool {
        return false
    }
    open func serializedSize() -> Int32 {
        return 0
    }
    
    open func getDescription(indent:String) throws -> String {
        throw ProtocolBuffersError.obvious("Override")
    }
    
    open func writeTo(codedOutputStream: CodedOutputStream) throws {
        throw ProtocolBuffersError.obvious("Override")
    }
    
    final public func writeTo(outputStream: OutputStream) throws {
        let codedOutput:CodedOutputStream = CodedOutputStream(stream:outputStream)
        try! writeTo(codedOutputStream: codedOutput)
        try codedOutput.flush()
    }
    
    public func writeDelimitedTo(outputStream: OutputStream) throws {
        let serializedDataSize = serializedSize()
        let codedOutputStream = CodedOutputStream(stream: outputStream)
        try codedOutputStream.writeRawVarint32(value: serializedDataSize)
        try writeTo(codedOutputStream: codedOutputStream)
        try codedOutputStream.flush()
    }
    
    open class func classBuilder() -> ProtocolBuffersMessageBuilder {
        return AbstractProtocolBuffersMessageBuilder()
    }
    
    open func classBuilder() -> ProtocolBuffersMessageBuilder {
        return AbstractProtocolBuffersMessageBuilder()
    }
    
    open var hashValue: Int {
        get {
            return unknownFields.hashValue
        }
    }
}



open class AbstractProtocolBuffersMessageBuilder:ProtocolBuffersMessageBuilder {
    open var unknownFields:UnknownFieldSet
    public init() {
        unknownFields = UnknownFieldSet(fields:Dictionary())
    }
    
    
    open func build() throws -> AbstractProtocolBuffersMessage {
        return AbstractProtocolBuffersMessage()
    }
    
    open func clone() throws -> Self {
        return self
    }
    open func clear() -> Self {
        return self
    }
    
    open func isInitialized() -> Bool {
        return false
    }
    
    open func mergeFrom(codedInputStream:CodedInputStream) throws ->  Self {
        return try mergeFrom(codedInputStream: codedInputStream, extensionRegistry:ExtensionRegistry())
    }
    
    open func mergeFrom(codedInputStream:CodedInputStream, extensionRegistry:ExtensionRegistry) throws ->  Self {
        throw ProtocolBuffersError.obvious("Override")
    }
    
    open func merge(unknownField: UnknownFieldSet) throws ->  Self {
        let merged:UnknownFieldSet = try UnknownFieldSet.builderWithUnknownFields(copyFrom: unknownFields).merge(unknownFields: unknownField).build()
        unknownFields = merged
        return self
    }
    
    final public func mergeFrom(data:Data) throws ->  Self {
        let input:CodedInputStream = CodedInputStream(data:data)
        _ = try mergeFrom(codedInputStream: input)
        try input.checkLastTagWas(value: 0)
        return self
    }
    
    
    final public func mergeFrom(data:Data, extensionRegistry:ExtensionRegistry) throws ->  Self {
        let input:CodedInputStream = CodedInputStream(data:data)
        _ = try mergeFrom(codedInputStream: input, extensionRegistry:extensionRegistry)
        try input.checkLastTagWas(value: 0)
        return self
    }
    
    final public func mergeFrom(inputStream: InputStream) throws -> Self {
        let codedInput:CodedInputStream = CodedInputStream(stream: inputStream)
        _ = try mergeFrom(codedInputStream: codedInput)
        try codedInput.checkLastTagWas(value: 0)
        return self
        
        
    }
    final public func mergeFrom(inputStream: InputStream, extensionRegistry:ExtensionRegistry) throws -> Self {
        let codedInput:CodedInputStream = CodedInputStream(stream: inputStream)
        _ = try mergeFrom(codedInputStream: codedInput, extensionRegistry:extensionRegistry)
        try codedInput.checkLastTagWas(value: 0)
        return self
    }
    
    //Delimited Encoding/Decoding
    public func mergeDelimitedFrom(inputStream: InputStream) throws -> Self? {
        var firstByte:UInt8 = 0
        if inputStream.read(&firstByte, maxLength: 1) != 1 {
            return nil
        }
        let rSize = try CodedInputStream.readRawVarint32(firstByte: firstByte, inputStream: inputStream)
        let data  = Data(bytes: [0],count: Int(rSize))
        let pointer = UnsafeMutablePointerUInt8From(data: data)
        inputStream.read(pointer, maxLength: Int(rSize))
        return try mergeFrom(data: data)
    }
}

