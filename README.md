# Math-Note-Template-By-Yukina (ctexart 版)

一个面向数学文章与短文写作的 LaTeX 模板，基于 `ctexart` 构建，内置统一的定理环境体系、数学符号库与交换图支持。它是 [Math-Note-Template-By-Yukina](https://github.com/moranzhuying/Math-Note-Template-By-Yukina)（`ctexbook` 版）的 article 简化版：面向单篇文章、讲义、短文等较短文档，不设独立习题集，但保留习题/解答环境供正文内嵌使用。

## 目录结构

```
.
├── main.tex              # 主文件：汇总前言、正文各节与后记
├── structure.sty         # 核心样式：页面布局、定理环境、符号库、引用
├── quiver.sty            # 交换图支持（q.uiver.app 导出，封装 tikz-cd）
├── commit.py             # 一键提交脚本（Python，Windows 可直接运行）
├── commit.sh             # 一键提交脚本（Bash 版，兼容）
├── update_cwl.py         # 从 structure.sty 自动生成 TeXStudio 补全（可选）
├── Content/                  # 内容目录
│   ├── Preface/              # 前言：全书结构、更新记录、记号说明
│   ├── 01_Test_Section/      # 正文测试节（三级嵌套示例）
│   │   ├── intro.tex         #   本节导引
│   │   ├── 01_Test_Subsection/  # 小节：index.tex + 段落文件
│   │   ├── Summary/          #   本节小结
│   │   └── Appendix_Test_A/  #   节内附录
│   ├── 02_Test_Section/      # 正文测试节
│   └── Appendix/             # 后记：术语对照表、参考文献
└── Figures/                  # 插图目录
```

## 模板特点

### 1. 中文文章排版

使用 `ctexart`（10pt / A4 / oneside），几何边距左右 1.5cm、上下 2cm，适合中文数学文章、讲义与短文。

### 2. 统一的定理环境体系

基于 `tcolorbox` 预置 22 种环境，按类别配色、可跨页断行（定理类共用节编号，习题独立编号）：

| 类别 | 环境 |
|------|------|
| 基础陈述 | 定义（蓝）、公理（靛蓝）、假设（青） |
| 推演结论 | 定理（红）、引理（橙）、命题（紫）、推论（绿）、元定理（靛蓝）、准则（茶） |
| 补充说明 | 问题（黄）、例（绿）、注记（灰） |
| 习题 | 习题（品红，独立编号）、解答（灰，题后即答） |
| 其他 | 算法、约定、警示、证明（自动加 ∎）、回答、分析、提示、代码块 |

每个环境带独立学术配色与顶边色条，视觉统一且易于区分。

### 3. 智能引用

`hyperref` + `cleveref`：`\cref` / `\autoref` 自动带类型名（显示"定义 1.1"而非"1.1"），中英文引用名均已配置。

### 4. 交换图支持

`quiver.sty` 封装 `tikz-cd`，可直接使用 q.uiver.app 导出的交换图，支持弯曲箭头、路径缩短与多种箭头样式。

### 5. 预置数学符号库

内置代数 / 几何 / 分析三大类常用记号，如 `\N \Z \Q \R \C`、`\Hom \End \Aut`、`\coker \coim \tor`、`\GL \SL \SO`、`\closure \interior` 等，面向抽象代数、范畴论与线性代数写作。

### 6. 内容分层管理

正文采用 section → subsection → subsubsection 三级嵌套结构，每层目录有 `index.tex` 汇总、逐级 `\input`。每节附带 `intro.tex`（本节导引）、`Summary/`（本节小结），每小节可带 `Summary/`（本小节小结）与节内附录 `Appendix_Name/`，将文档拆分为小文件，便于维护与复用。

> 与 ctexbook 版的对应关系：章 → 节、节 → 小节、小节 → 段（subsubsection）。定理/习题编号仍为「1.1」形式（挂节编号）。

### 7. 双栏目录

基于 `multicol` 重定义 `\tableofcontents`：标题通栏、目录内容双栏排版，减少目录占用页数；PDF 书签正常保留。正文无需额外改动，照常写 `\tableofcontents` 即可。

## 测试计划

模板内置两个测试节（`Content/01_Test_Section`、`02_Test_Section`），按复杂度从低到高验证：

| 轮次 | 复杂度 | 测试项目 |
|------|--------|----------|
| 第一轮 | 基础 | 正文文字与列表、基础公式（equation/align/gather）、核心定理环境、习题/解答、单图与单表插入、四种引用（\ref / \autoref / \cref / \eqref） |
| 第二轮 | 进阶 | 公式进阶（multline/cases/矩阵/subequations/\tag）、其余定理环境、并排图、多列表格、脚注、超链接、嵌套列表、多标签引用 |
| 第三轮 | 交换图 | tikz-cd 交换图：张量积泛性质、五引理 |

## 更新日志

详细更新记录见 [ChangeLog.md](./ChangeLog.md)。

## 使用

### 编译

用 XeLaTeX 编译 `main.tex` 即可：

```bash
latexmk -xelatex main.tex
```

新增小节时，在 `Content/` 下按三级结构新建目录（section → subsection → 段落文件），每层建 `index.tex` 汇总，并在上一级 `\input` 引入。

### 习题环境

习题与解答环境保留，供正文内嵌使用（题后即答）：

```latex
\begin{exercise}{题目标题}{exr:label}
    题目内容.
\end{exercise}

\begin{solution}
    解答内容.
\end{solution}
```

习题使用独立编号（`exercisecount`，如「习题 1.1」），与定理环境互不干扰，可直接 `\autoref{exr:label}` 引用。

### 脚本工具

#### `commit.py` / `commit.sh` — 一键提交

自动完成「检查改动 → 暂存 → 提交 → 推送到 GitHub」四步，无改动时自动跳过。

```bash
python commit.py "提交说明"    # Python 版（推荐，Windows 直接可用）
bash commit.sh "提交说明"      # Bash 版（兼容）
```

不写提交说明则默认「更新文章」。推送走 SSH（GitHub 443 端口已配置）。

#### `update_cwl.py` — TeXStudio 补全同步（可选）

从 `structure.sty` 的数学符号库（[模块 VI]）自动提取 `\newcommand` / `\renewcommand`，生成 TeXStudio 的 `custom.cwl` 补全条目。修改符号库后运行一次即可，TeXStudio 重启后生效。

```bash
python update_cwl.py                      # 写入默认路径
python update_cwl.py "自定义路径.cwl"     # 指定输出路径
```
