import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/common/components/widgets/simple_toast.dart';

Future<void> launchURL({
  required String url,
  bool isSocialMedia = false,
}) async {
  if (!url.startsWith("https")) {
    url = "https://$url";
  }
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    SimpleToast.showSimpleToast(
        msg: isSocialMedia ? "حدث خطأ ما" : "من فضلك تأكد من الرابط");
  }
}

Future<void> launchWhatsApp({
  required String phone,
  String message = 'مرحبا بك',
}) async =>
    await launchURL(
      url: "https://api.whatsapp.com/send?phone=+$phone&text=$message",
      isSocialMedia: true,
    );

Future<void> launchFacebook({
  required String user,
}) async =>
    await launchURL(
      url: "https://www.facebook.com/$user/",
      isSocialMedia: true,
    );

Future<void> launchInstagram({
  required String user,
}) async =>
    await launchURL(
      url: "https://www.instagram.com/$user/",
      isSocialMedia: true,
    );

Future<void> launchTwitter({
  required String user,
}) async =>
    await launchURL(
      url: "https://www.linkedin.com/in/$user/",
      isSocialMedia: true,
    );

Future<void> launchContact({required String phoneNumber}) async =>
    await launchUrl(Uri.parse("tel://$phoneNumber"));

Future<List<File>?> getImageFile(
  BuildContext context, {
  bool allowMultiple = false,
}) async {
  FocusScope.of(context).requestFocus(FocusNode());
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: allowMultiple,
  );
  if (result != null) {
    if (!allowMultiple) {
      File imageFile = File(result.files.single.path!);
      return [imageFile];
    } else {
      return result.files.map((e) => File(e.path!)).toList();
    }
  }
  return null;
}

Future<File?> getAttachmentFile(FileType fileType) async {
  if (fileType == FileType.any) {
    return await getAPdfFile();
  }
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: false,
  );
  if (result != null) {
    File imageFile = File(result.files.single.path!);
    return imageFile;
  }
  return null;
}

Future<File?> getAPdfFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, allowMultiple: false, allowedExtensions: ['pdf']);
  if (result != null) {
    File imageFile = File(result.files.single.path!);
    return imageFile;
  }
  return null;
}

Future<String> fileToBase64(File file) async {
  List<int> bytes = await file.readAsBytes();
  return base64Encode(bytes);
}

bool isEmail(String input) => RegExp(
      '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?'
      '[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
      '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
      ')|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
    ).hasMatch(input);

bool isPhoneNumber(String input) =>
    RegExp(r'^(?:\+966|966|0)(5\d{8})$').hasMatch(input);

String getFormattedTime(String date) {
  return DateFormat('kk:mm a').format(DateTime.parse(date));
}

void shareLink(String path) => Share.share(path);
