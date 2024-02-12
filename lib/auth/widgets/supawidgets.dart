import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:session2d2v2/core/colors.dart';
import 'package:session2d2v2/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<User?> SignUser(String email,String pass,String phone, String name ) async {
  var res = await supabase.auth.signUp(
      password: pass, email: email);
  var user = res.user;
  var session = res.session;
  if (user != null) {
    await supabase.from('profiles').insert({
      'id_user': user.id,
      'phone': phone,
      'name': name,
      'avatar': ''
    });
    return user!;

    }
  else{return null;}
}

Future<User?> Signinus(String pass, String email) async                         {
  var res = await supabase.auth
      .signInWithPassword(
      password: pass,
      email: email);
  return res.user;


                                                                                }

Future<User?> SendOTP(String email) async                                       {

await supabase.auth.resetPasswordForEmail(email);

                                                                                }

Future<User?> Verifyotp(String otp, String email) async                            {
  var res = await supabase.auth
      .verifyOTP(token: otp, type: OtpType.email, email: email);
  var user = res.user;
  return user;
}

Future<void> newpassword(newpass) async{
  await supabase.auth.updateUser(UserAttributes(password: newpass));
}

Future<void> subscribeOrder(String orderId, callback) async {
  supabase
      .channel("orders-status-changes")
      .onPostgresChanges(
      event: PostgresChangeEvent.update,
      schema: "public",
      table: "orders",
      filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: "id",
          value: orderId
      ),
      callback: (payload) {
        callback(payload.newRecord);
      }
  )
      .subscribe();
}