# 更新日志 (ChangeLog)

**版本日期**: 2026-10-06
**当前状态**: 模板初始版本，持续完善中

---

## 2026-10-06 更新概览

同步 ctexbook 版（笔记写作）的两项改动：补齐 `\Cref` 系列的中文引用名、调整常用记号；`README.md` 的定理环境清单改用英文环境名，并补入面向外部素材改写的要点。

### 优化与改进

* **补齐 `\Crefname`（首字母大写引用名）**
    * 17 个定理类环境补上 `\Crefname`。此前只有小写形式 `\crefname`，`\Cref{标签}` 会退回英文名（如 `Theorem`）。
* **新增与调整记号**
    * `\Re`、`\Im` 改为直立算子（`\operatorname`），覆盖内核默认的花体 ℜ / ℑ。
    * 新增 `\i`（虚数单位，正体）与 `\dd`（微分算子，前面自动留细空）。
* **`README.md`**
    * 定理环境清单改用**英文环境名**（`definition`、`axiom` …），与环境实际名称一致。
    * 在「定理环境体系」「智能引用」「交换图支持」三节补入面向外部素材改写的要点：环境类型服从论证角色、假设与结论的区分不遗落、并列显示公式合并进 `align` 系环境、有序列举一律用 `enumerate`、箭头—节点型数学图用 `tikz-cd` 重排、标签唯一且引用不硬编码编号。

---

## 2026-09-02 更新概览

首个版本：由 ctexbook 模板（笔记写作）迁移为 ctexart 模板，面向单篇文章、讲义与短文写作。

### 新增功能

* **ctexart 文档骨架**
    * 主文件 `main.tex`、核心样式包 `structure.sty`、交换图包 `quiver.sty`。
    * 无 `\chapter` / `\part` / `\frontmatter`，最高层级为 `\section`。
* **三级嵌套结构（整体下移一级）**
    * 章 → 节、节 → 小节、小节 → 段（subsubsection），每层 `index.tex` 汇总。
    * 每节含 `intro.tex`（本节导引）、`Summary/`（本节小结），每小节可带 `Summary/`（本小节小结）与节内附录 `Appendix_Name/`。
* **习题/解答环境（保留，无独立习题集）**
    * `exercise`（品红，独立编号 `exercisecount`）与 `solution`（灰色，题后即答）环境保留，正文内嵌使用。
* **脚本工具**
    * `commit.py` / `commit.sh` 一键提交、`update_cwl.py` 补全同步脚本。

### 相对 ctexbook 版的调整

* 定理/习题计数器由 `chapter` 改挂 `section`，编号仍为「1.1」形式。
* 显式设置 `secnumdepth=3`、`tocdepth=3`，使第三级（subsubsection）带编号并进入目录。
* 移除 `\noteref` 跨文档引用宏与 `setup_mode.py` 模式切换脚本（不设独立习题集）。
* 三级标题改用 titlesec 统一定制（`\Large` / `\large` / `\normalsize`）。
