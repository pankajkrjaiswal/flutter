class DataResponse {
  bool status;
  String message;
  dynamic data;
  DataResponse({
    this.data,
    required this.message,
    required this.status,
  });
  factory DataResponse.success({required dynamic data}) {
    return DataResponse(
      message: "",
      status: true,
      data: data,
    );
  }

 factory DataResponse.error({required  String message}) {
    return DataResponse(
      message: "",
      status: false,
      
    );
  }
}
