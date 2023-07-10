import 'package:intl/intl.dart';
import 'package:yelwinoo/data/model/contact.dart';
import 'package:yelwinoo/services/abstract/contact_service.dart';

class ContactViewModel {
  ContactViewModel({required this.service});
  final ContactService service;
  String name = '';
  String job = '';
  String email = '';
  String message = '';
  String error = '';
  final dateFormat = DateFormat.yMMMMEEEEd();

  bool sendMessage() {
    if (validateFormFields) {
      service.sendMessage(convertToContact).then((_) {
        return true;
      }).onError((error, stackTrace) {
        error = error.toString();
        return false;
      });
      return true;
    } else {
      return false;
    }
  }

  Contact get convertToContact => Contact(
        date: dateFormat.format(DateTime.now()),
        name: name,
        email: email,
        job: job,
        message: message,
      );
  bool get validateFormFields =>
      name.isNotEmpty && email.isNotEmpty && job.isNotEmpty;
}
