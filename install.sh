#!/usr/bin/env bash

# Salir inmediatamente si ocurre un error inesperado
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "================================================="
echo "  Iniciando instalación de Dotfiles..."
echo "================================================="

# 1. Crear directorios necesarios en $HOME
echo "--> Creando directorios en $HOME..."
mkdir -p "$HOME/.config/starship"
mkdir -p "$HOME/.local/bin"

# 2. Crear enlaces simbólicos (remplaza archivos/enlaces previos con -sf)
echo "--> Enlazando .bashrc..."
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

echo "--> Enlazando configuración de Starship..."
ln -sf "$DOTFILES_DIR/config/starship/starship.toml" "$HOME/.config/starship/starship.toml"

# 3. Crear el archivo de secretos ~/.env si no existe (con permisos seguros)
if [ ! -f "$HOME/.env" ]; then
    echo "--> Creando archivo ~/.env para variables privadas..."
    cat << 'EOF' > "$HOME/.env"
# Variables secretas locales (no sincronizadas con Git)
# Ejemplo:
# export ANTHROPIC_API_KEY="tu_clave_aqui"
EOF
    # Permiso 600: Solo tu usuario puede leer y escribir este archivo
    chmod 600 "$HOME/.env"
    echo "    ✔ Archivo ~/.env creado con permisos restringidos (600)."
fi

# 4. Comprobar e instalar Starship si no existe en el sistema
if ! command -v starship &> /dev/null; then
    echo "--> Starship no encontrado. Instalando..."
    # -y acepta automáticamente la instalación sin pausar la terminal
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "--> Starship ya está instalado."
fi

echo "================================================="
echo " ¡Instalación completada con éxito!"
echo " Ejecuta: source ~/.bashrc para aplicar los cambios."
echo "================================================="

