# YouTube to MP3 Downloader

Script bash per scaricare e convertire video YouTube in file MP3 di alta qualità.

## 📋 Prerequisiti

Prima di utilizzare lo script, assicurati di avere installati i seguenti programmi:

### Su Ubuntu/Debian

```bash
sudo apt update
sudo apt install ffmpeg yt-dlp
```

### Su ArchLinux

```bash
sudo pacman -Sy ffmpeg yt-dlp
```

### Su macOS (con Homebrew)

```bash
brew install ffmpeg yt-dlp
```

### Con pip (alternativa)

```bash
pip install yt-dlp
```

**Nota:** `ffmpeg` è necessario per la conversione audio in MP3.

## 🚀 Installazione

1. Scarica lo script `youtube_mp3.sh`
2. Rendilo eseguibile:

```bash
chmod +x youtube_mp3.sh
```

## 📖 Uso

### Sintassi

```bash
./youtube_mp3.sh <file_con_links> <cartella_destinazione>
```

### Parametri

- `<file_con_links>`: Path del file di testo contenente i link YouTube (uno per riga)
- `<cartella_destinazione>`: Path della cartella dove salvare gli MP3

### Esempio

```bash
./youtube_mp3.sh links.txt ~/Musica
```

## 📝 Formato del file dei link

Crea un file di testo (es. `links.txt`) con i link YouTube, uno per riga:

```
https://www.youtube.com/watch?v=dQw4w9WgXcQ
https://www.youtube.com/watch?v=9bZkp7q19f0
https://www.youtube.com/watch?v=kJQP7kiw5Fk
```

### Funzionalità avanzate del file

- **Righe vuote**: vengono ignorate automaticamente
- **Commenti**: le righe che iniziano con `#` vengono saltate

Esempio:

```
# Playlist canzoni preferite
https://www.youtube.com/watch?v=dQw4w9WgXcQ

# Podcast
https://www.youtube.com/watch?v=9bZkp7q19f0

# Da scaricare dopo
# https://www.youtube.com/watch?v=kJQP7kiw5Fk
```

## ✨ Caratteristiche

- ✅ Conversione in MP3 con **qualità audio massima**
- ✅ Aggiunge automaticamente **metadati** (titolo, artista, ecc.)
- ✅ Incorpora la **copertina/thumbnail** del video
- ✅ Supporto per **righe vuote** e **commenti**
- ✅ **Contatore di progresso** per ogni download
- ✅ **Riepilogo finale** con statistiche
- ✅ **Gestione errori** completa
- ✅ Crea automaticamente la cartella di destinazione se non esiste

## 📊 Output dello script

Durante l'esecuzione, lo script mostrerà:

```
Inizio download e conversione...
File links: links.txt
Destinazione: /home/user/Musica
-----------------------------------

[1] Scaricamento: https://www.youtube.com/watch?v=dQw4w9WgXcQ
[download] Destination: /home/user/Musica/Rick Astley - Never Gonna Give You Up.mp3
✓ Completato con successo

[2] Scaricamento: https://www.youtube.com/watch?v=9bZkp7q19f0
✓ Completato con successo

===================================
RIEPILOGO:
Totale link processati: 2
Download riusciti: 2
Errori: 0
===================================
```

## 🔧 Risoluzione problemi

### Errore: "yt-dlp non è installato"

Installa yt-dlp con uno dei metodi indicati nella sezione Prerequisiti.

### Errore: "ffmpeg non è installato"

Installa ffmpeg:

```bash
sudo apt install ffmpeg  # Ubuntu/Debian
brew install ffmpeg      # macOS
```

### I video non vengono scaricati

- Verifica che i link siano corretti e accessibili
- Controlla la tua connessione internet
- Alcuni video potrebbero avere restrizioni geografiche o di età

### Aggiornare yt-dlp

Se riscontri problemi con video recenti, aggiorna yt-dlp:

```bash
pip install --upgrade yt-dlp
# oppure
sudo apt update && sudo apt upgrade yt-dlp
```

## 📄 Licenza

Questo script è fornito "così com'è", senza garanzie di alcun tipo.

## ⚠️ Avviso legale

Assicurati di avere il diritto di scaricare e convertire i contenuti YouTube. Rispetta le leggi sul copyright e i termini di servizio di YouTube. Utilizza questo script solo per contenuti di cui hai il permesso di scaricare o per uso personale consentito.

## 🤝 Contributi

Suggerimenti e miglioramenti sono benvenuti!

---

**Nota:** Questo script utilizza `yt-dlp`, un fork migliorato di `youtube-dl` che è più veloce e supporta più siti.
