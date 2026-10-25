# 🚀 VibeOS - To'liq Qo'llanma & Cheatsheet (Vibe Wiki)

VibeOS ga xush kelibsiz! Ushbu tizim zamonaviy dasturchilar, sun'iy intellekt (AI) bilan kod yozuvchilar va maksimal unumdorlikni xohlovchilar uchun maxsus yaratilgan.

---

## 🪟 1. Windows Foydalanuvchilari Uchun Qulay Qisqartmalar (Hotkeys)

Windows'dan o'tgan dasturchilar darhol o'zini uydagidek his qilishi uchun tanish tugmalar to'liq sozlangan:

| Qisqartma | Vazifasi | Qaysi dastur ochiladi? |
| :--- | :--- | :--- |
| **`Win + E`** | Fayllar menejerini ochish | Dolphin / Thunar (Fayllar) |
| **`Win + V`** | Nusxa olish tarixi (Clipboard History) | Cliphist (Rofi dmenu) |
| **`Win + Shift + S`** | Ekran qismini rasmga olish (Snipping Tool) | Grim + Slurp + Swappy |
| **`Ctrl + Shift + Esc`** | Vazifalar menejeri (Task Manager) | Btop / Plasma System Monitor |
| **`Win + R`** | Dasturlarni qidirish va ishga tushirish (Run) | KRunner / Rofi Application Launcher |
| **`Win + D`** | Ish stolini ko'rsatish (Show Desktop) | Barcha oynalarni yashirish |
| **`Win + L`** | Ekranni qulflash (Lock Screen) | Lock Screen |
| **`Alt + Tab`** | Oynalar orasida o'tish | Window Switcher |

---

## ⚡ 2. Vibe Coding & Dasturchi Qisqartmalari

Kod yozish jarayonida qo'lni klaviaturadan uzmaslik uchun:

| Qisqartma | Vazifasi | Izoh |
| :--- | :--- | :--- |
| **`Win + Space`** | **Floating AI Scratchpad** | Tezkor AI bilan kod tahlili va suhbat |
| **`Win + /` yoki `Win + F1`** | **Vibe Wiki** | Shu qo'llanmani darhol ekranga chiqaradi |
| **`Win + Enter`** | Tezkor Terminal | Kitty / Alacritty GPU-accelerated terminal |
| **`Win + C`** | Kod muharriri | VS Code / Cursor / Neovim |
| **`Win + B`** | Veb brauzer | Cachy-Browser / Firefox |
| **`Win + G`** | Git boshqaruvi | Lazygit (Terminal Git UI) |
| **`Win + M`** | Konteynerlar boshqaruvi | Lazydocker (Docker/Podman UI) |

---

## 🤖 3. Sun'iy Intellekt (AI) Bilan Ishlash

VibeOS tizimida mahalliy (local) va bulutli (cloud) AI vositalari birlashtirilgan:

### Mahalliy Ollama (Local LLM)
Tizim ichida Ollama xizmati mavjud. Internetisiz, to'liq shaxsiy modelingizni ishlatish uchun:
```bash
# Ollama xizmatini yoqish:
systemctl --user start ollama

# Kodlash uchun eng yaxshi yengil modellarni yuklab olish:
ollama run qwen2.5-coder:7b
# yoki
ollama run deepseek-coder-v2:16b
```

### Terminal AI Assistant: `vibe-ai-chat`
Terminalda to'g'ridan-to'g'ri `vibe-ai-chat` deb yozing yoki istalgan vaqtda **`Win + Space`** ni bosing.

---

## 🛠️ 4. Tezkor Paket Menejerlari & Runtimes

VibeOS dunyodagi eng tezkor vositalar bilan jihozlangan:

- **Python:** `uv` o'rnatilgan (`pip` dan 10-100 barobar tezroq!):
  ```bash
  uv venv
  uv pip install fastapi uvicorn
  ```
- **JavaScript / TypeScript:** `bun` o'rnatilgan:
  ```bash
  bun create next-app
  bun run dev
  ```
- **Rust:** `rustup` tayyor:
  ```bash
  rustup default stable
  ```
- **Tizim paketlari:**
  ```bash
  # Standart Arch va CachyOS repolaridan:
  sudo pacman -Syu paket_nomi
  
  # AUR (Arch User Repository) dan:
  paru -S paket_nomi
  ```

---

## 🎨 5. Terminal Vibe & CLI Vositalari

- `ff` yoki `fastfetch` — Tizim ma'lumotlari va VibeOS logosi
- `lg` — `lazygit` ni ishga tushirish
- `ld` — `lazydocker` ni ishga tushirish
- `ls` o'rniga `eza` (chiroyli ranglar va ikonalar)
- `cat` o'rniga `bat` (kod sintaksisi ranglari bilan)
- `cd` o'rniga `z` (`zoxide` aqlli katalog o'tish)

---
*VibeOS - Code with Flow, Speed, and Vibe!*
