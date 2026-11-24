# 经济学论文编辑模型

供 Apple 芯片 Mac 上使用的本地英文论文编辑器。它提供英文润色、逐处差异和引用原句的中文论证审阅。分享包内含 Qwen3-8B 的 MLX 4-bit 底座以及两轮 QLoRA 权重，默认加载接受 1,395 步训练的扩充轮适配器。

## 下载与使用

1. 下载并解压 [Mac 模型下载器](https://github.com/ZhenyuanPAN822/econ-editor-qwen3-8b-mlx/releases/download/v1.0.0/Download-EconEditor-Mac.zip)。
2. 双击其中的 `Download-EconEditor.command`。它从此仓库下载两份分卷、校验 SHA-256，并在同目录恢复为完整的 `EconEditor-Qwen3-8B-MLX.zip`（4.18 GB）。
3. 解压模型包，双击「打开训练版编辑器.command」。首次启动需要联网安装运行依赖，此后可离线改稿。

已手动下载两个分卷的读者，可以把它们与下载器放进同一目录再双击。该步骤会复用并校验已有分卷。模型和依赖需要在可写的本地文件夹中运行。

[查看全部发布附件](https://github.com/ZhenyuanPAN822/econ-editor-qwen3-8b-mlx/releases/tag/v1.0.0)

## 训练和评估

扩充轮用 121 篇经济学五大刊论文整理出 1,873 个任务，其中 1,395 个进入训练。论文的正式卷期年份截至 2020 年，96 篇来自 2016–2020 年。包中附有书目、逐项来源和模型版本说明。

在 68 题的 Codex 盲评中，扩充轮相对底座的得分为英文润色 57.4%、论证审阅 45.6%（胜计 1 分，平计 0.5 分）。两项都未达到原项目 60% 且无新增实质错误的启用门槛。分享版默认加载训练权重供比较，切换首轮或基线的方法见包内的「模型说明.md」。

底座和分词器的 Apache-2.0 许可随包附上，论文保留各自的权利。 [Qwen3-8B 许可](https://huggingface.co/Qwen/Qwen3-8B/blob/main/LICENSE) · [MLX 量化版本](https://huggingface.co/mlx-community/Qwen3-8B-4bit/tree/545dc4251c05440727734bcd94334791f6ab0192)

