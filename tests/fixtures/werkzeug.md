# Fristwächter

Fristwächter ist ein Open-Source-Werkzeug (MIT-Lizenz), das eingehende Post
überwacht und Fristen nicht mehr untergehen lässt.

## Funktionsweise

1. **Eingang:** Fristwächter liest PDF-Dokumente aus einem Ordner und E-Mails aus
   einem IMAP-Postfach.
2. **Extraktion:** Ein lokal laufendes Sprachmodell (über Ollama) erkennt
   Fristangaben wie «innert 30 Tagen ab Zustellung» oder «bis spätestens
   15. November» und rechnet sie in ein Datum um. Feste Datumsformate erkennt
   ein Regelwerk mit regulären Ausdrücken, auch ohne Sprachmodell.
3. **Ablage:** Jede Frist wird mit Quelle, Absender und Originalzitat in einen
   CalDAV-Kalender geschrieben.
4. **Erinnerung:** Sieben Tage und einen Tag vor Ablauf verschickt Fristwächter
   eine Erinnerung per E-Mail oder Matrix-Nachricht.

## Technik

- Python 3.11, läuft auf einem Raspberry Pi 5 oder einem Server
- Alle Daten bleiben lokal; es gibt keinen Cloud-Dienst
- Unsichere Erkennungen (Konfidenz unter 0,8) landen in einer Prüfliste und
  werden erst nach menschlicher Bestätigung in den Kalender übernommen

## Grenzen

- Handschriftliche Dokumente werden nicht erkannt
- Fristen, die sich aus Gesetzen statt aus dem Dokument ergeben, erkennt das
  Werkzeug nicht
