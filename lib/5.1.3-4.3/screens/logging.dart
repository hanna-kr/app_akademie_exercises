import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoggingExercise extends StatelessWidget {
  const LoggingExercise({super.key});

  @override
  Widget build(BuildContext context) {
    final Logger logger = Logger();

// Only certain levels will be displayed:
    // Logger.level = Level.warning;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Logging'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    debugPrint('Hello World');
                    logger.t('trace log');
                    logger.d('debug log');
                    logger.i('info log');
                    logger.w('warning log');
                    logger.e('error log', error: 'test error');
                    logger.f('fatal log',
                        error: 'error',
                        stackTrace: StackTrace.fromString('FatalError'));
                  },
                  child: const Text('Log General')),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            logger.t(
                                'Trace-Nachricht: Ein Trace-Log enthält typischerweise Informationen über den Start und das Ende von Funktionen oder Methoden, die Parameterwerte, die von den Funktionen empfangen oder zurückgegeben werden, sowie andere relevante Ereignisse und Zustandsänderungen während der Ausführung der Anwendung.');
                          },
                          child: const Text('Trace Log')),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            logger.d(
                                'Debug-Nachricht: Der Debug-Log ist besonders nützlich, um den Zustand der Anwendung zu überwachen, Fehler zu finden und den Programmfluss nachzuvollziehen. Entwickler können ihre eigenen Log-Nachrichten erstellen und diese mit zusätzlichen Informationen wie Zeitstempeln, Dateinamen oder Zeilennummern versehen, um den Debugging-Prozess zu erleichtern.');
                          },
                          child: const Text('Debug Log')),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            logger.i(
                                'Info-Nachricht: Durch die Verwendung des Info-Log-Levels können Entwickler wichtige Informationen und Statusaktualisierungen im Log anzeigen lassen, ohne dabei mit zu vielen Details überflutet zu werden.');
                          },
                          child: const Text('Info Log')),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            logger.w(
                                'Warnungs-Nachricht: Warning-Logs werden normalerweise verwendet, um auf Situationen hinzuweisen, die nicht unbedingt zu einem sofortigen Fehler führen, aber dennoch bedacht werden sollten. Dies können beispielsweise veraltete Methodenaufrufe, unsichere Verhaltensweisen oder potenzielle Leistungsprobleme sein.');
                          },
                          child: const Text('Warning Log')),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            logger.e(
                                'Error-Nachricht: Wenn im Code ein Fehler auftritt, der die normale Ausführung des Programms unterbricht oder zu unerwartetem Verhalten führt, kann der Logger verwendet werden, um eine Fehlermeldung zu generieren und diese in einem Log-File oder einer anderen Ausgabequelle zu speichern.',
                                error: 'test error');
                          },
                          child: const Text('Error Log')),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            logger.f(
                                'Fatal-Error-Nachricht: Der Begriff "fatal log" wird in Flutter verwendet, um auf eine spezielle Art von Protokollierungsnachricht hinzuweisen, die auf einen schwerwiegenden Fehler hinweist. Wenn ein solcher Fehler auftritt, der das Programm zum Absturz bringt, wird ein "fatal log" erstellt. ',
                                error: 'error',
                                stackTrace:
                                    StackTrace.fromString('FatalError'));
                          },
                          child: const Text('Fatal Log')),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
