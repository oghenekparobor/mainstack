bool urlValidator(String url) {
  return Uri.parse(url).host.isNotEmpty;
}
