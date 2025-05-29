# protoc-gen-mcpgo

`protoc-gen-mcpgo` 是一个 `protoc` 插件，用于根据您的 `.proto` 服务定义自动生成与 [mcp-go](https://github.com/mark3labs/mcp-go) 兼容的 MCP (MetaCall Protocol) 服务代码。

## 功能

- 根据 Protobuf 服务定义生成 MCP 服务结构体和构造函数。
- 为每个服务方法生成 MCP Tool 定义，并自动从注释中提取描述信息。
- 支持通过注释标记字段为必需 (`@mcp: required`)。
- 支持通过注释跳过特定方法的生成 (`@mcp: reject`)。
- 自动将 Protobuf 类型映射到 MCP 参数类型 (String, Number, Boolean)。
- 生成 RPC 处理函数，用于将 MCP 请求转换为实际的服务方法调用。

## 安装

### 前提条件

- [Go](https://golang.org/doc/install) (版本 1.16+)
- [Protocol Buffer Compiler (protoc)](https://grpc.io/docs/protoc-installation/)

### 构建和安装插件

1.  克隆本仓库 (或者如果您已经拥有代码):

    ```bash
    # git clone https://github.com/f-rambo/protoc-gen-mcpgo.git
    # cd protoc-gen-mcpgo
    ```

2.  构建并安装插件:

    ```bash
    make install
    ```

    这会将 `protoc-gen-mcpgo` 二进制文件安装到您的 `$GOPATH/bin` 目录下。请确保该目录在您的 `PATH` 环境变量中。

    或者，您可以手动构建:

    ```bash
    make build
    ```

    然后将生成的 `bin/protoc-gen-mcpgo` 可执行文件复制到您的 `PATH` 中的某个位置。

## 使用方法

在您的 `.proto` 文件所在的目录中，运行以下 `protoc` 命令：

```bash
protoc --go_out=. --go_opt=paths=source_relative \
       --mcpgo_out=. --mcpgo_opt=paths=source_relative,go_package_name=<your_go_package_name>,go_module_name=<your_go_module_name> \
       your_service.proto
```
