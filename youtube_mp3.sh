#!/bin/bash

# Script per scaricare video YouTube come MP3
# Uso: ./youtube_mp3.sh <file_links> <cartella_destinazione>

# Verifica argomenti
if [ $# -ne 2 ]; then
    echo "Uso: $0 <file_con_links> <cartella_destinazione>"
    echo "Esempio: $0 links.txt ~/Musica"
    exit 1
fi

FILE_LINKS="$1"
DEST_PATH="$2"

# Verifica che il file dei link esista
if [ ! -f "$FILE_LINKS" ]; then
    echo "Errore: Il file '$FILE_LINKS' non esiste"
    exit 1
fi

# Crea la cartella di destinazione se non esiste
mkdir -p "$DEST_PATH"

# Verifica che yt-dlp sia installato
if ! command -v yt-dlp &> /dev/null; then
    echo "Errore: yt-dlp non è installato"
    echo "Installalo con: pip install yt-dlp"
    echo "oppure: sudo apt install yt-dlp"
    exit 1
fi

# Verifica che ffmpeg sia installato (necessario per la conversione)
if ! command -v ffmpeg &> /dev/null; then
    echo "Errore: ffmpeg non è installato"
    echo "Installalo con: sudo apt install ffmpeg"
    exit 1
fi

echo "Inizio download e conversione..."
echo "File links: $FILE_LINKS"
echo "Destinazione: $DEST_PATH"
echo "-----------------------------------"

# Contatore
TOTALE=0
SUCCESSO=0
ERRORI=0

# Legge il file riga per riga
while IFS= read -r link || [ -n "$link" ]; do
    # Salta righe vuote e commenti
    if [ -z "$link" ] || [[ "$link" =~ ^[[:space:]]*# ]]; then
        continue
    fi
    
    ((TOTALE++))
    echo ""
    echo "[$TOTALE] Scaricamento: $link"
    
    # Scarica e converte in MP3
    if yt-dlp -x \
        --audio-format mp3 \
        --audio-quality 0 \
        --embed-thumbnail \
        --add-metadata \
        -o "$DEST_PATH/%(title)s.%(ext)s" \
        "$link"; then
        ((SUCCESSO++))
        echo "✓ Completato con successo"
    else
        ((ERRORI++))
        echo "✗ Errore durante il download"
    fi
    
done < "$FILE_LINKS"

# Riepilogo finale
echo ""
echo "==================================="
echo "RIEPILOGO:"
echo "Totale link processati: $TOTALE"
echo "Download riusciti: $SUCCESSO"
echo "Errori: $ERRORI"
echo "==================================="

exit 0
