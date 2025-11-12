#!/bin/bash

gsettings set org.mate.interface gtk-theme 'TraditionalOk'
gsettings set org.mate.Marco.general theme 'TraditionalOk'
gsettings set org.mate.interface icon-theme 'gnome'
gsettings set org.mate.background picture-filename /usr/share/desktop-base/spacefun-theme/wallpaper/contents/images/3840x2160.svg

# Ruta de la imatge SVG
IMATGE="/usr/share/desktop-base/spacefun-theme/login/background.svg"

# Fitxer de configuració
CONFIG="/etc/lightdm/lightdm-gtk-greeter.conf"
BACKUP="${CONFIG}.bak"

# Comprovacions
if [ ! -f "$IMATGE" ]; then
    echo "❌ La imatge no existeix: $IMATGE"
    exit 1
fi

if [ ! -f "$CONFIG" ]; then
    echo "❌ No s'ha trobat el fitxer de configuració: $CONFIG"
    exit 1
fi

# Còpia de seguretat
sudo cp "$CONFIG" "$BACKUP"
echo "📁 Còpia de seguretat creada a: $BACKUP"

# Elimina qualsevol línia background= o #background=
sudo sed -i '/^#\?background=/d' "$CONFIG"

# Afegeix la nova línia al final
echo "background=$IMATGE" | sudo tee -a "$CONFIG" > /dev/null

echo "✅ Línia background actualitzada amb la imatge SVG."




# Per a revisar si funciona correctament.# Comprova que s'ha indicat la ruta de la imatge
if [ -z "$1" ]; then
  echo "❌ Has d'indicar la ruta de la imatge com a primer argument."
  echo "Ús: $0 /usr/share/desktop-base/spacefun-theme/wallpaper/contents/images/3840x2160.svg"
  exit 1
fi

IMATGEBLOQ="$1"

# Comprova si la imatge existeix
if [ ! -f "$IMATGEBLOQ" ]; then
  echo "⚠️ La imatge no existeix: $IMATGEBLOQ"
  exit 1
fi

# Estableix la imatge com a fons d'escriptori
gsettings set org.mate.background picture-filename "$IMATGEBLOQ"

# Assegura que MATE Screensaver utilitza el fons d'escriptori
gsettings set org.mate.screensaver use-theme-background true

echo "✅ Imatge de bloqueig configurada amb: $IMATGEBLOQ"
