# DayZFix

<div align="center">

```text
==============================================================================
                         DAYZFIX - CLEANER & OPTIMIZER
                  Safe Cache, Logs and Crash Dumps Cleaner
==============================================================================
```

**The ultimate open-source DayZ cache, crash dump & junk cleaner for Windows.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6.svg?logo=windows)](https://www.microsoft.com/windows)
[![BattlEye Safe](https://img.shields.io/badge/BattlEye-100%25%20Safe-brightgreen.svg)]()
[![Pure Batch](https://img.shields.io/badge/Engine-100%25%20Pure%20Batch-orange.svg)]()

[Español](#-español) • [English](#-english)

</div>

---

## 🇪🇸 Español

### 📌 ¿Por qué necesitas DayZFix?
**DayZ** y **Bohemia Interactive** acumulan con el tiempo enormes cantidades de archivos temporales en tu disco:
- Reportes de error (`.RPT`) y registros de consola (`.log`).
- Volcados de memoria de caídas del juego (`.mdmp`, `.bidmp`, `.dmp`) que pueden llegar a ocupar **más de 10 GB a 30 GB**.
- Caché temporal corrupta del lanzador.
- Caché de sombreadores (Shader Cache de DirectX/NVIDIA/AMD) fragmentada que suele causar **micro-tirones (*stutters*) y bajadas bruscas de FPS**.

**DayZFix** es un script **.BAT puro** diseñado para máxima compatibilidad: funciona al instante con solo hacer doble clic, sin configuraciones extra ni dependencias.

---

### 🚀 Características principales
- ✅ **100% Seguro contra BattlEye & VAC:** Solo limpia logs, volcados y cachés temporales de Windows.
- ✅ **Protege tus ajustes:** No borra tus perfiles de jugador, sensibilidad ni controles (`.DayZProfile`, `.cfg`).
- ✅ **Detección inteligente de procesos:** Cierra limpiamente DayZ o el Launcher si están en ejecución para evitar bloqueos.
- ✅ **Limpieza de Shader Cache:** Elimina caché obsoleta de DirectX, NVIDIA y AMD para solucionar tirones y problemas de texturas.
- ✅ **Máxima compatibilidad:** Un único archivo `.bat` compatible con Windows 10, 11 y anteriores.

---

### 💻 Cómo usarlo

1. Descarga el archivo [`DayZFix.bat`](DayZFix.bat).
2. Haz **doble clic** sobre `DayZFix.bat`.
3. Selecciona la opción deseada en el menú numérico:
   - `[1]` **Quick Clean:** Limpia reportes y volcados de error (`.RPT`, `.log`, `.mdmp`).
   - `[2]` **Launcher Cache:** Limpia temporales del launcher oficial.
   - `[3]` **Shader Cache:** Limpia DirectX / GPU Cache.
   - `[4]` **FULL CLEANUP:** Ejecuta la optimización y limpieza completa recomendada.

---

### ❓ Preguntas Frecuentes (FAQ)

<details>
<summary><b>¿Puedo ser baneado por BattlEye o VAC por usar DayZFix?</b></summary>
<b>No. Absolutamente no.</b> DayZFix no inyecta código en la memoria ni modifica los ejecutables del juego ni los archivos del servidor. Únicamente elimina archivos de registro e informes de error de Windows generados por el juego.
</details>

<details>
<summary><b>¿Se borrarán mis teclas o configuración gráfica?</b></summary>
<b>No.</b> Tus configuraciones se guardan en la carpeta Documentos y DayZFix únicamente limpia archivos de caché y registros en <code>%localappdata%\DayZ</code> y cachés de shaders.
</details>

---

## 🇬🇧 English

### 📌 Why DayZFix?
DayZ continuously writes debug logs, crash minidumps, and report files to your local drive. Over months of gameplay and modded server sessions, these files can bloat to **10 GB – 40+ GB**, fragmenting disk storage and causing stuttering.

**DayZFix** is a pure, lightweight `.bat` utility built for plug-and-play simplicity and maximum Windows compatibility.

### 🌟 Key Features
- **BattlEye / VAC Safe:** Touches only log/dump files and temporary caches.
- **Settings Protected:** Preserves your keybindings, graphics configuration, and profiles.
- **Process Guard:** Checks and terminates locked `DayZ_x64.exe` or `DayZLauncher.exe` instances.
- **Shader Cache Reset:** Purges DirectX, NVIDIA, and AMD shader caches to fix micro-stuttering.
- **Zero Dependencies:** Pure Windows batch script.

---

## 📄 License
This project is licensed under the [MIT License](LICENSE).
