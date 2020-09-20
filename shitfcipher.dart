import 'dart:io';

String encrypt(String text, int k) {
  String result = '';

  for (var i = 0; i < text.length; i++) {
    //encrypt uppercase letters
    if (text[i] == text[i].toUpperCase())
      result += String.fromCharCode((text[i].codeUnitAt(0) + k - 65) % 26 + 65);
    //encrypt lowercase letters
    else
      result += String.fromCharCode((text[i].codeUnitAt(0) + k - 97) % 26 + 97);
  }

  return result;
}

String decrypt(String text, int k) {
  String result = '';

  for (var i = 0; i < text.length; i++) {
    //decrypt uppercase letters
    if (text[i] == text[i].toUpperCase())
      result += String.fromCharCode((text[i].codeUnitAt(0) - k - 65) % 26 + 65);
    //decrypt lowercase letters
    else
      result += String.fromCharCode((text[i].codeUnitAt(0) - k - 97) % 26 + 97);
  }

  return result;
}

main(List<String> args) {
  print('\n===[SHIFT CIPHER]===\n');

  stdout.write('Text: ');
  String text = stdin.readLineSync();

  stdout.write('Shifter (number): ');
  int shifter = int.parse(stdin.readLineSync());

  stdout.write('Method ([1]encrypt/[2]decrypt)? ');
  int method = int.parse(stdin.readLineSync());

  print('\nRESULT:');
  if (method == 1)
    print(encrypt(text, shifter));
  else
    print(decrypt(text, shifter));
}
