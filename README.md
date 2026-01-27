[![GitHub Release](https://img.shields.io/github/v/release/smashedr/hls-downloader-go?logo=github)](https://github.com/smashedr/hls-downloader-go/releases/latest)
[![GitHub Downloads](https://img.shields.io/github/downloads/smashedr/hls-downloader-go/total?logo=rolldown&logoColor=white)](https://github.com/smashedr/hls-downloader-go/releases)
[![Go Version](https://img.shields.io/github/go-mod/go-version/smashedr/hls-downloader-go?logo=go&logoColor=white&label=go)](https://github.com/smashedr/hls-downloader-go/blob/master/go.mod)
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
- [Support](#Support)
- [Contributing](#Contributing)

A rewrite of [cssnr/hls-downloader-client](https://github.com/cssnr/hls-downloader-client) in Go.

- Web Extension: https://github.com/cssnr/hls-video-downloader

> [!IMPORTANT]  
> This project is still in development but functional.  
> You must **uninstall** the original client before installing.

## Status

[![Windows](https://raw.githubusercontent.com/smashedr/repo-images/refs/heads/master/os/windows48.png)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe)
[![Linux](https://raw.githubusercontent.com/smashedr/repo-images/refs/heads/master/os/linux48.png)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer.deb)
[![macOS](https://raw.githubusercontent.com/smashedr/repo-images/refs/heads/master/os/macos48.png)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/macos-installer.pkg)

See below for additional details on each system.

| System      |                                                                           Arch                                                                            | Status |
| :---------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------: | :----: |
| **Windows** | [![Windows](https://img.shields.io/badge/Intel-amd64-blue)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe) |   ✅   |
| **Windows** | [![Windows](https://img.shields.io/badge/Intel-i386-blue)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe)  |   ✅   |
| **Windows** |                                                  ![Windows](https://img.shields.io/badge/ARM-arm64-blue)                                                  |   ⛔   |
| **Linux**   |   [![Linux](https://img.shields.io/badge/Intel-amd64-blue)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer.deb)   |   ✅   |
| **Linux**   |                                                  ![Linux](https://img.shields.io/badge/ARM-arm64-blue)]                                                   |   ⚠️   |
| **macOS**   |   [![macOS](https://img.shields.io/badge/Intel-amd64-blue)](https://github.com/smashedr/hls-downloader-go/releases/latest/download/macos-installer.pkg)   |   ✅   |
| **macOS**   |                                                   ![macOS](https://img.shields.io/badge/ARM-arm64-blue)                                                   |   ⚠️   |

### Windows 🪟

- No option to skip ffmpeg download yet

I don't plan to support an installer for ARM (but the app supports ARM).

[windows-installer.exe](https://github.com/smashedr/hls-downloader-go/releases/latest/download/windows-installer.exe)

### Linux 🐧

- Requires ffmpeg in PATH (default PATH).

The .deb installer needs to be updated to package and install the Intel and ARM version.

[linux-installer.deb](https://github.com/smashedr/hls-downloader-go/releases/latest/download/linux-installer.deb)

### macOS 🍎

Requires ffmpeg in PATH. Additional PATH's checked:

- `/usr/local/bin`
- `/opt/homebrew/bin`
- `/opt/local/bin`
- `/sw/bin`
- `~/bin`

The .pkg installer needs to be updated to package and install the Intel and ARM version.

[macos-installer.pkg](https://github.com/smashedr/hls-downloader-go/releases/latest/download/macos-installer.pkg)

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
