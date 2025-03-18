import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  final String _noReplyEmail = 'noreply@vidstube.com';
  final String _password = 'your_app_specific_password';

  Future<bool> sendEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    try {
      // Create the SMTP server configuration
      final smtpServer = gmail(_noReplyEmail, _password);

      // Create the email message
      final message = Message()
        ..from = Address(_noReplyEmail, 'VidsTube')
        ..recipients.add(toEmail)
        ..subject = subject
        ..text = body;

      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Email sent: ${sendReport.toString()}');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }
}
