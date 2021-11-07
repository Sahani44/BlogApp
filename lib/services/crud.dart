import 'package:cloud_firestore/cloud_firestore.dart';


class CrudMethods{

  Future<void> addData(blogData) async{

    FirebaseFirestore.instance.collection("Blogs").add(blogData).catchError((e){
      print(e);
    });

  }


  Future<void> updateData(updatedBlogData,blogId) async{

    FirebaseFirestore.instance.collection("Blogs").doc(blogId).update(updatedBlogData);

  }


  Stream<QuerySnapshot?>  get getData  {
    return FirebaseFirestore.instance.collection("Blogs").snapshots();
  }

}