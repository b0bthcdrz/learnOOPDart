import 'package:intl/intl.dart';
import 'dart:io';

void main(){
  List<Note>  notes = [];


  
  
  while (true){
    print("\n--- Simple Note APP ---");
    print("1. Add Note");
    print("2. View Notes");
    print("3. Exit");
    stdout.write("Type 1,2, or 3 and enter to choose.");

    String? userChoice = stdin.readLineSync();
    
    if (userChoice == '1'){
      String? title;
      String? content;
      try {
        stdout.write('Enter title : ');
        title = stdin.readLineSync();
        if (title == null || title.trim().isEmpty ) {
          throw ('Title cannot be empty');
        }

        stdout.write('Enter content : ');
        content = stdin.readLineSync();
        if (content == null || content.trim().isEmpty) {
          throw ('Content cannot be empty');
        }
        notes.add(Note(title, content));
      } catch(e) {
        print("Cannot add note because: $e");
      }
      
    } else if (userChoice == '2') {
      for (var note in notes){
      print("ID: ${note.id}");
      print("Time: ${DateFormat.yMd().add_Hm().format(note.timestamp)}");
      print("Title: ${note.title}");
      print("Title: ${note.content}");
      print("===");
    }   
    } else if (userChoice == '3') {
      break;
    } else {
      print('Please any key');
    }
  }
}

class Note{
  static int nextId = 1 ;
  int id;
  String title;
  String content;
  DateTime timestamp;
  
  Note(this.title, this.content,)
    : id = nextId++, timestamp = DateTime.now();

}