[![GitHub Release](https://img.shields.io/github/v/release/smashedr/hls-downloader-go?logo=github)](https://github.com/smashedr/hls-downloader-go/releases/latest)
[![GitHub Downloads](https://img.shields.io/github/downloads/smashedr/hls-downloader-go/total?logo=rolldown&logoColor=white)](https://github.com/smashedr/hls-downloader-go/releases)
[![Go Version](https://img.shields.io/github/go-mod/go-version/smashedr/hls-downloader-go?logo=go&logoColor=white&label=go)](https://github.com/smashedr/hls-downloader-go/blob/master/go.mod)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=smashedr_hls-downloader-go&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=smashedr_hls-downloader-go)
[![Workflow Lint](https://img.shields.io/github/actions/workflow/status/smashedr/hls-downloader-go/lint.yaml?logo=testcafe&logoColor=white&label=lint)](https://github.com/smashedr/hls-downloader-go/actions/workflows/lint.yaml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/smashedr/hls-downloader-go?logo=listenhub&label=updated)](https://github.com/smashedr/hls-downloader-go/pulse)
[![GitHub Repo Size](https://img.shields.io/github/repo-size/smashedr/hls-downloader-go?logo=buffer&label=repo%20size)](https://github.com/smashedr/hls-downloader-go?tab=readme-ov-file#readme)
[![GitHub Top Language](https://img.shields.io/github/languages/top/smashedr/hls-downloader-go?logo=devbox)](https://github.com/smashedr/hls-downloader-go?tab=readme-ov-file#readme)
[![GitHub Contributors](https://img.shields.io/github/contributors-anon/smashedr/hls-downloader-go?logo=southwestairlines)](https://github.com/smashedr/hls-downloader-go/graphs/contributors)
[![GitHub Issues](https://img.shields.io/github/issues/smashedr/hls-downloader-go?logo=codeforces&logoColor=white)](https://github.com/smashedr/hls-downloader-go/issues)
[![GitHub Discussions](https://img.shields.io/github/discussions/smashedr/hls-downloader-go?logo=theconversation)](https://github.com/smashedr/hls-downloader-go/discussions)
[![GitHub Forks](https://img.shields.io/github/forks/smashedr/hls-downloader-go?style=flat&logo=forgejo&logoColor=white)](https://github.com/smashedr/hls-downloader-go/forks)
[![GitHub Repo Stars](https://img.shields.io/github/stars/smashedr/hls-downloader-go?style=flat&logo=gleam&logoColor=white)](https://github.com/smashedr/hls-downloader-go/stargazers)
[![GitHub Org Stars](https://img.shields.io/github/stars/cssnr?style=flat&logo=apachespark&logoColor=white&label=org%20stars)](https://cssnr.github.io/)
[![Discord](https://img.shields.io/discord/899171661457293343?logo=discord&logoColor=white&label=discord&color=7289da)](https://discord.gg/wXy6m2X8wY)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-72a5f2?logo=kofi&label=support)](https://ko-fi.com/cssnr)

# HLS Video Downloader Go

<a title="HLS Video Downloader" href="https://github.com/cssnr/hls-video-downloader" target="_blank">
<img alt="HLS Video Downloader" align="right" width="128" height="auto" src="https://raw.githubusercontent.com/smashedr/hls-downloader-go/refs/heads/master/assets/logo.png"></a>

- [Status](#Status)
  - [Windows](#windows-)
  - [Linux](#linux-)
  - [macOS](#macos-)
  - [Homebrew](#homebrew-)
- [Support](#Support)
- [Contributing](#Contributing)

HLS Video Downloader Client. A Rewrite of [cssnr/hls-downloader-client](https://github.com/cssnr/hls-downloader-client) in Go.

A Web Extension Native Messaging Client written in Go with installers for most platforms.

[![Windows](https://raw.githubusercontent.com/smashedr/repo-images/refs/heads/master/os/windows48.png)](#windows-)
[![Linux](https://raw.githubusercontent.com/smashedr/repo-images/refs/heads/master/os/linux48.png)](#linux-)
[![macOS](https://raw.githubusercontent.com/smashedr/repo-images/refs/heads/master/os/macos48.png)](#macos-)

> [!IMPORTANT]  
> This project is still in development but is very functional!  
> You must **uninstall** the original client before installing.

- Web Extension: [cssnr/hls-video-downloader](https://github.com/cssnr/hls-video-downloader)

[![Chrome](https://raw.githubusercontent.com/alrra/browser-logos/main/src/chrome/chrome_48x48.png)](https://chromewebstore.google.com/detail/hls-video-downloader/mpmiiaolodhanoalpjncddpmnkbjicbo)
[![Firefox](https://raw.githubusercontent.com/alrra/browser-logos/main/src/firefox/firefox_48x48.png)](https://addons.mozilla.org/addon/hls-video-downloader)
[![Edge](https://raw.githubusercontent.com/alrra/browser-logos/main/src/edge/edge_48x48.png)](https://chromewebstore.google.com/detail/hls-video-downloader/mpmiiaolodhanoalpjncddpmnkbjicbo)
[![Chromium](https://raw.githubusercontent.com/alrra/browser-logos/main/src/chromium/chromium_48x48.png)](https://chromewebstore.google.com/detail/hls-video-downloader/mpmiiaolodhanoalpjncddpmnkbjicbo)
[![Brave](https://raw.githubusercontent.com/alrra/browser-logos/main/src/brave/brave_48x48.png)](https://chromewebstore.google.com/detail/hls-video-downloader/mpmiiaolodhanoalpjncddpmnkbjicbo)
[![Vivaldi](https://raw.githubusercontent.com/alrra/browser-logos/main/src/vivaldi/vivaldi_48x48.png)](https://chromewebstore.google.com/detail/hls-video-downloader/mpmiiaolodhanoalpjncddpmnkbjicbo)
[![Opera](https://raw.githubusercontent.com/alrra/browser-logos/main/src/opera/opera_48x48.png)](https://chromewebstore.google.com/detail/hls-video-downloader/mpmiiaolodhanoalpjncddpmnkbjicbo)

## Status

Status of installer packages and supported architectures.

| System      | Architecture&nbsp;&nbsp;&nbsp;                                                                                                                                     | Installer | Homebrew | Current&nbsp;Status |
| :---------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------: | :------: | ------------------- |
| **Windows** | [![Windows](https://img.shields.io/badge/Intel-amd64-brightgreen)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe)   |    ✅     |          | Finished            |
| **Windows** | [![Windows](https://img.shields.io/badge/Intel-i386-yellowgreen)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe)    |    ✅     |          | Finished            |
| **Windows** | [![Windows](https://img.shields.io/badge/ARM-arm64-blue)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe)            |    ✅     |          | Finished            |
| **Linux**   | [![Linux](https://img.shields.io/badge/Intel-amd64-brightgreen)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer-amd64.deb) |    ☑️     |    🍺    | Working             |
| **Linux**   | [![Linux](https://img.shields.io/badge/Intel-i386-yellowgreen)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer-i386.deb)   |    ☑️     |          | Working             |
| **Linux**   | [![Linux](https://img.shields.io/badge/ARM-arm64-blue)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer-arm64.deb)          |    ☑️     |    🍺    | Working             |
| **macOS**   | [![macOS](https://img.shields.io/badge/Intel-amd64-brightgreen)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/macos-installer.pkg)       |    ☑️     |    🍺    | Working             |
| **macOS**   | [![macOS](https://img.shields.io/badge/ARM-arm64-blue)](#)                                                                                                         |    ⚠️     |    🍺    | Homebrew Only       |

### Windows 🪟

- [windows-installer.exe](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe) (all)

Caveats:

- None

### Linux 🐧

- [linux-installer-amd64.deb](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer-amd64.deb)
- [linux-installer-i386.deb](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer-i386.deb)
- [linux-installer-arm64.deb](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer-arm64.deb)
- [Homebrew](#homebrew-) (all x64)

Caveats:

- Requires ffmpeg in PATH.

### macOS 🍎

- [macos-installer.pkg](https://github.com/smashedr/hls-downloader-go/releases/latest/download/macos-installer.pkg) (intel only)
- [Homebrew](#homebrew-) (all)

Caveats:

- Requires ffmpeg in PATH.
- The installer does not yet support M-series (ARM).

Additional PATH's checked.

```text
/usr/local/bin
/opt/homebrew/bin
/opt/local/bin
/sw/bin
~/bin
```

### Homebrew 🍺

Depends on Formula `ffmpeg`.

```shell
brew install cssnr/tap/hls
```

If you already have `ffmpeg` installed.

```shell
brew install cssnr/tap/hls --without-ffmpeg
```

Caveats:

- You must run the commands in the Caveats after the installation.

# Support

If you run into any issues or need help getting started, please do one of the following:

- Report an Issue: <https://github.com/smashedr/hls-downloader-go/issues>
- Q&A Discussion: <https://github.com/smashedr/hls-downloader-go/discussions/categories/q-a>
- Request a Feature: <https://github.com/smashedr/hls-downloader-go/issues/new?template=1-feature.yaml>
- Chat with us on Discord: <https://discord.gg/wXy6m2X8wY>

[![Features](https://img.shields.io/badge/features-brightgreen?style=for-the-badge&logo=rocket&logoColor=white)](https://github.com/smashedr/hls-downloader-go/issues/new?template=1-feature.yaml)
[![Issues](https://img.shields.io/badge/issues-red?style=for-the-badge&logo=southwestairlines&logoColor=white)](https://github.com/smashedr/hls-downloader-go/issues)
[![Discussions](https://img.shields.io/badge/discussions-blue?style=for-the-badge&logo=theconversation&logoColor=white)](https://github.com/smashedr/hls-downloader-go/discussions)
[![Discord](https://img.shields.io/badge/discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/wXy6m2X8wY)

# Contributing

If you would like to submit a PR, please review the [CONTRIBUTING.md](#contributing-ov-file).

Please consider making a donation to support the development of this project
and [additional](https://cssnr.com/) open source projects.

[![Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/cssnr)

For a full list of current projects visit: [https://cssnr.github.io/](https://cssnr.github.io/)
