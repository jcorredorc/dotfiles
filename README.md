# dotfiles
Personal Linux dotfiles and configuration for my development environment.


🛠️ My Personal Dotfiles

Mi configuración personal para Bash en Ubuntu 24.04 y Raspberry Pi OS, gestionada con Git, enlaces simbólicos (symlinks) y personalizada visualmente con Starship.

📁 Estructura del Repositorio

dotfiles/
├── bash/
│   └── .bashrc             # Configuración principal de Bash
│── config/
│   └── starship/
│       └── starship.toml   # Configuración de apariencia de Starship
├── install.sh              # Script de instalación automática
└── README.md               # Documentación del proyecto

🚀 Instalación Rápida

Para instalar estas configuraciones en un sistema nuevo (Linux / Ubuntu / Raspberry Pi), ejecuta los siguientes comandos en tu terminal:

```bash
# 1. Clonar el repositorio en tu directorio home
git clone [https://github.com/jcorredorc/dotfiles.git](https://github.com/jcorredorc/dotfiles.git) ~/dotfiles

# 2. Entrar al directorio
cd ~/dotfiles

# 3. Dar permisos de ejecución al script
chmod +x install.sh

# 4. Ejecutar el script de instalación
./install.sh

# 5. Cargar la nueva configuración
source ~/.bashrc

```

🔒 Variables Secretas y Entorno Local (~/.env)

Las claves secretas de API (por ejemplo, ANTHROPIC_API_KEY) y contraseñas no se suben a este repositorio por razones de seguridad.

El script install.sh crea automáticamente un archivo secreto en tu máquina local ubicado en ~/.env con permisos restringidos (chmod 600).

Para agregar tus claves privadas en un equipo nuevo, simplemente edita tu archivo local:

```
nano ~/.env

```
Agrega tus variables utilizando el formato export:

```
export ANTHROPIC_API_KEY="sk-ant-api03-tu-clave-aqui"

```
⚙️ Características e Integraciones Condicionales

El .bashrc de este repositorio está optimizado para funcionar en múltiples máquinas sin generar errores por herramientas no instaladas:

*    ROS2 (Jazzy): Se carga automáticamente solo si el directorio /opt/ros/jazzy existe en la máquina.
*    Starship Prompt: Se inicializa automáticamente si la herramienta está instalada.
*    Herramientas adicionales: Compatibilidad con zoxide, yazi y accesos directos personalizados.


# ToDo

[ ] Organizar alias
