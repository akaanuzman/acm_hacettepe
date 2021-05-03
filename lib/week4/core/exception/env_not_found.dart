class EnvNotFound implements Exception{
  final String? value;

  EnvNotFound(this.value);

  @override
  String toString() {
  return "This $value doesn't found in env file";
   }
}