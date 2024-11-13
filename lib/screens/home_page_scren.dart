import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../configuration/theme.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: App_theme.scondery,
        elevation: 0,
        toolbarHeight: 120,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Delivering to ',
                  style: TextStyle(
                      color:App_theme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: App_theme.primary,
                  size: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dubai, Street 55 Dub Tower',
                  style: TextStyle(
                      color: App_theme.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        actions:  [
          CircleAvatar(
            backgroundColor: App_theme.backgroundwhite,
            radius: 25,
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color:  App_theme.black,
              width: 24,
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 195,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(top:33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Custom Plan ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: App_theme.primary,
                            ),
                          ),
                          TextSpan(
                            text: 'is ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color:  App_theme.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Available Now!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color:  App_theme.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Custom your meals day by day',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:  App_theme.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 140,
                      height: 37,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: App_theme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Try it now', style: TextStyle(color:  App_theme.backgroundwhite),),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, color: App_theme.backgroundwhite, size: 16,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories 😋',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Show All',
                        style: TextStyle(color: App_theme.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 81,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/home2.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/home3.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  'Hot Deals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 146,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/home4.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
