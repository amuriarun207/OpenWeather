  
abstract class ListItem {}

class SectionHeader implements ListItem {
  final String title;
  SectionHeader(this.title);
}

class DescriptionCell implements ListItem {
  final String title;
  final String value;
  DescriptionCell(this.title, this.value);
}