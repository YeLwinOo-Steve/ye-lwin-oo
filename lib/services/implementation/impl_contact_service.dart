import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/data/model/contact.dart';
import 'package:yelwinoo/services/abstract/contact_service.dart';

class ImplContactService extends ContactService {
  final contactRef =
      FirebaseFirestore.instance.collection("messages").withConverter<Contact>(
            fromFirestore: (snapshot, _) => Contact.fromJson(snapshot.data()!),
            toFirestore: (contact, _) => contact.toJson(),
          );
  @override
  Future<void> sendMessage(Contact contact) async {
    try {
      await contactRef.doc(contact.email).set(contact);
    } catch (ex) {
      Logger().e(ex);
      throw Exception(ex.toString());
    }
  }
}
