# 🚀 VibeOS - To'liq Qo'llanma & Cheatsheet (Vibe Wiki)

**Tizim asoschisi va muallifi:** [backandchi](https://github.com/backandchi)  
**Rasmiy loyiha:** [github.com/backandchi/vibe-os](https://github.com/backandchi/vibe-os)  
**Til:** O'zbek tili 🇺🇿

---

## 🌟 VibeOS Haqida
VibeOS — bu O'zbekiston va butun dunyo dasturchilari uchun yaratilgan, yuqori unumdorlikka ega, sun'iy intellekt (AI) bilan kod yozishga (Vibe Coding) moslashtirilgan zamonaviy operatsion tizimdir.

Muallif **backandchi** tomonidan tizimga Windows foydalanuvchilari uchun qulay bo'lgan barcha tanish tugmalar va eng so'nggi dasturchi asboblari birlashtirildi.

---

## 🪟 1. Windows Foydalanuvchilari Uchun Qisqartmalar (Hotkeys)

Windows tizimidan o'tgan dasturchilar darhol qulay ishlashi uchun barcha standart tugmalar sozlangan:

| Tugmalar birikmasi | Nima ish bajaradi? | Ochiladigan dastur |
| :--- | :--- | :--- |
| **`Win + E`** | Fayllar boshqaruvchisini ochish | Dolphin / Thunar (Fayl menejeri) |
| **`Win + V`** | Nusxa olish tarixi (Clipboard tarixi) | Cliphist (Kopiya qilingan matnlar) |
| **`Win + Shift + S`** | Ekranni qirqib rasmga olish (Snipping Tool) | Grim + Slurp + Swappy |
| **`Ctrl + Shift + Esc`** | Vazifalar menejeri (Task Manager) | Btop (Protsessor, RAM, GPU nazorati) |
| **`Win + R`** | Dasturlarni tezkor qidirish va ochish (Run) | Rofi / KRunner |
| **`Win + D`** | Ish stolini ko'rsatish | Barcha ochiq oynalarni yashirish |
| **`Win + L`** | Kompyuter ekranini qulflash | Lock Screen |
| **`Alt + Tab`** | Oynalar orasida tezkor o'tish | Window Switcher |

---

## ⚡ 2. Vibe Coding & Dasturchi Qisqartmalari

Kod yozish jarayonida qo'lni klaviaturadan uzmaslik uchun:

| Tugmalar birikmasi | Vazifasi | Izoh |
| :--- | :--- | :--- |
| **`Win + Space`** | **Floating AI Scratchpad** | Ekranda suzuvchi AI yordamchi oynasi |
| **`Win + /` yoki `Win + F1`** | **Vibe Wiki** | Ushbu o'zbekcha qo'llanmani darhol ekranga chiqaradi |
| **`Win + Enter`** | Tezkor Terminal | Kitty GPU-tezlatilgan terminali |
| **`Win + C`** | Kod muharriri | VS Code / Cursor / Neovim |
| **`Win + B`** | Internet brauzer | Cachy-Browser / Firefox |
| **`Win + G`** | Git boshqaruvi | Lazygit (Terminalda Git bilan ishlash) |
| **`Win + M`** | Konteynerlar boshqaruvi | Lazydocker (Docker va Podman UI) |
| **`Win + Q`** | Oynani yopish | Faol oynani darhol yopadi |

---

## 🤖 3. Sun'iy Intellekt (AI) Bilan Ishlash

VibeOS tizimida mahalliy (local) va bulutli (cloud) AI vositalari birlashtirilgan:

### Mahalliy Ollama (Internet talab qilmaydigan AI)
Ollama xizmatini yoqish:
```bash
systemctl --user start ollama
```

Kod yozish uchun maxsus modellarni o'rnatish:
```bash
ollama run qwen2.5-coder:7b
# yoki
ollama run deepseek-coder-v2:16b
```

### Tezkor AI Yordamchi:
Istalgan vaqtda **`Win + Space`** tugmasini bosing yoki terminalda:
```bash
vibe-ai-chat
```

---

## 🛠️ 4. Tezkor Paket Menejerlari & Runtimes

- **Python (uv):** Dunyodagi eng tezkor paket o'rnatgich:
  ```bash
  uv venv
  uv pip install fastapi uvicorn
  ```
- **JavaScript / TypeScript (bun):**
  ```bash
  bun create next-app
  bun run dev
  ```
- **Rust (rustup):**
  ```bash
  rustup default stable
  ```
- **Tizim dasturlarini o'rnatish:**
  ```bash
  # Rasmiy repolardan:
  sudo pacman -Syu dastur_nomi

  # AUR (Arch User Repository) dan:
  paru -S dastur_nomi
  ```

---

## 🎨 5. Terminal Qisqartmalari (Aliases)

- `ff` — VibeOS logosi va tizim holati (Fastfetch)
- `lg` — Lazygit (Git interfeysi)
- `ld` — Lazydocker (Docker interfeysi)
- `ls` o'rniga `eza` (rang-barang va ikonkali ro'yxat)
- `cat` o'rniga `bat` (kod sintaksisi bilan)
- `cd` o'rniga `z` (aqlli papkaga o'tish)

---
*VibeOS — Muallif: backandchi. O'zbek dasturchilari uchun maxsus yaratilgan.*
