import 'package:barka/features/chat/direct_chat.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  // --- ACTIONS ---
  Future<void> openWhatsApp(String phone, String message) async {
    final Uri url = Uri.parse(
      "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open WhatsApp");
    }
  }

  Future<void> openEmail(String email, String subject) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=${Uri.encodeComponent(subject)}',
    );
    if (!await launchUrl(url)) {
      throw Exception("Could not send email");
    }
  }

  Future<void> openPhone(String phone) async {
    final Uri url = Uri(scheme: 'tel', path: phone);
    if (!await launchUrl(url)) {
      throw Exception("Could not call $phone");
    }
  }

  // --- UI ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Us"), centerTitle: true),
      body: ListView(
        children: [
          // Support Hours
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Row(
              children: const [
                Icon(Icons.access_time, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Support Hours: Mon-Sat, 9:00 AM - 6:00 PM",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // WhatsApp
          ListTile(
            leading: const Icon(
              Icons.chat_outlined,
              color: Colors.green,
              size: 28,
            ),
            title: const Text("WhatsApp"),
            subtitle: const Text("Chat with us instantly"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () =>
                openWhatsApp("1234567890", "Hello, I need help with my order"),
          ),

          const Divider(),

          // In-App Direct Message
          ListTile(
            leading: const Icon(
              Icons.chat_bubble_outline,
              color: Colors.blue,
              size: 28,
            ),
            title: const Text("Direct Message"),
            subtitle: const Text("Chat inside the app"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DirectMessagePage(),
                ),
              );
              // Navigate to your chat screen
            },
          ),

          const Divider(),

          // Call Us
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.teal, size: 28),
            title: const Text("Call Us"),
            subtitle: const Text("Talk to our support agent"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => openPhone("1234567890"),
          ),

          const Divider(),

          // Email Support
          ListTile(
            leading: const Icon(
              Icons.email_outlined,
              color: Colors.deepOrange,
              size: 28,
            ),
            title: const Text("Email Support"),
            subtitle: const Text("Send us your inquiry"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => openEmail("support@example.com", "Customer Inquiry"),
          ),

          const SizedBox(height: 20),

          // Quick Help Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Quick Help",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: [
                    _quickHelpButton(context, "Order Status"),
                    _quickHelpButton(context, "Return Request"),
                    _quickHelpButton(context, "Payment Help"),
                    _quickHelpButton(context, "Technical Issue"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickHelpButton(BuildContext context, String label) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/chat", arguments: {"prefill": label});
      },
      child: Text(label),
    );
  }
}
