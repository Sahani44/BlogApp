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

  
  Future<void> addAdData(blogData) async{

    FirebaseFirestore.instance.collection("AppDevBlogs").add(blogData).catchError((e){
      print(e);
    });

  }


  Future<void> updateAdData(updatedBlogData,blogId) async{

    FirebaseFirestore.instance.collection("AppDevBlogs").doc(blogId).update(updatedBlogData);

  }


  Stream<QuerySnapshot?>  get getAdData  {
    return FirebaseFirestore.instance.collection("AppDevBlogs").snapshots();
  }


  Future<void> addCpData(blogData) async{

    FirebaseFirestore.instance.collection("CppBlogs").add(blogData).catchError((e){
      print(e);
    });

  }


  Future<void> updateCpData(updatedBlogData,blogId) async{

    FirebaseFirestore.instance.collection("CppBlogs").doc(blogId).update(updatedBlogData);

  }


  Stream<QuerySnapshot?>  get getCpData  {
    return FirebaseFirestore.instance.collection("CppBlogs").snapshots();
  }


  Future<void> addDesData(blogData) async{

    FirebaseFirestore.instance.collection("DesBlogs").add(blogData).catchError((e){
      print(e);
    });

  }


  Future<void> updateDesData(updatedBlogData,blogId) async{

    FirebaseFirestore.instance.collection("DesBlogs").doc(blogId).update(updatedBlogData);

  }


  Stream<QuerySnapshot?>  get getDesData  {
    return FirebaseFirestore.instance.collection("DesBlogs").snapshots();
  }


  Future<void> addGitData(blogData) async{

    FirebaseFirestore.instance.collection("GitBlogs").add(blogData).catchError((e){
      print(e);
    });

  }


  Future<void> updateGitData(updatedBlogData,blogId) async{

    FirebaseFirestore.instance.collection("GitBlogs").doc(blogId).update(updatedBlogData);

  }


  Stream<QuerySnapshot?>  get getGitData  {
    return FirebaseFirestore.instance.collection("GitBlogs").snapshots();
  }


  Future<void> addJaData(blogData) async{

    FirebaseFirestore.instance.collection("JavaBlogs").add(blogData).catchError((e){
      print(e);
    });

  }


  Future<void> updateJaData(updatedBlogData,blogId) async{

    FirebaseFirestore.instance.collection("JavaBlogs").doc(blogId).update(updatedBlogData);

  }


  Stream<QuerySnapshot?>  get getJaData  {
    return FirebaseFirestore.instance.collection("JavaBlogs").snapshots();
  }


  Future<void> addWebData(blogData) async{

    FirebaseFirestore.instance.collection("WebBlogs").add(blogData).catchError((e){
      print(e);
    });

  }


  Future<void> updateWebData(updatedBlogData,blogId) async{

    FirebaseFirestore.instance.collection("WebBlogs").doc(blogId).update(updatedBlogData);

  }


  Stream<QuerySnapshot?>  get getWebData  {
    return FirebaseFirestore.instance.collection("WebBlogs").snapshots();
  }

}