import 'package:flutter/material.dart';

import 'data/questions.dart';

class Result extends StatelessWidget {
  const Result(
    this.selectedAnswers,
    this.restart, {
    super.key,
  });

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get _getSummaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question index': i,
        'question': questions[i].text,
        'your answer': selectedAnswers[i],
        'correct answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var count = 0;
    for (var i = 0; i < selectedAnswers.length; i++) {
      if (_getSummaryData[i]['your answer'] ==
          _getSummaryData[i]['correct answer']) {
        count++;
      }
    }
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'You answered $count out of ${selectedAnswers.length} questions correctly!',
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                // fontStyle: FontStyle.italic,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ..._getSummaryData.map(
              (e) => Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: e['your answer'] == e['correct answer']
                            ? Colors.green[300]
                            : Colors.red[300],
                        child: Text(
                          ((e['question index'] as int) + 1).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['question'].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${e['your answer']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(222, 180, 163, 163),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              '${e['correct answer']}',
                              style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.black,
              ),
              onPressed: restart,
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// ...selectedAnswers.map(
//             (e) => Container(
//               margin: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 5,
//               ),
//               child: Text(
//                 e,
//                 style: const TextStyle(fontWeight: FontWeight.w900),
//               ),
//             ),
//           ),
