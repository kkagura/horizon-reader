# Horizon 每日速递 - 2026-05-26

> 从 8 条内容中筛选出 7 条重要资讯。

---

1. [加州拟将 Linux 排除在年龄验证法案之外](#item-1) ⭐️ 8.0/10
2. [借助 AI 慢工出更优质的代码](#item-2) ⭐️ 7.0/10
3. [挪威部署 2PB 华为闪存用于本土 LLM 训练](#item-3) ⭐️ 7.0/10
4. [Mullvad 推出出口 IP 指纹识别缓解方案](#item-4) ⭐️ 7.0/10
5. [Microsoft Copilot Cowork Exfiltrates Files](#item-5) ⭐️ 7.0/10
6. [教皇利奥十四世 AI 伦理通谕解读](#item-6) ⭐️ 7.0/10
7. [全新 Hacker News 首页浏览网页应用上线](#item-7) ⭐️ 6.0/10

---

<a id="item-1"></a>
## [加州拟将 Linux 排除在年龄验证法案之外](https://www.tomshardware.com/software/linux/california-moves-to-exempt-linux-from-its-upcoming-age-verification-law-after-backlash-over-forcing-operating-systems-to-collect-users-ages-amendment-proposed-by-the-same-lawmaker-who-wrote-the-original-law) ⭐️ 8.0/10

加州即将出台的年龄验证法案的原起草人提出了一项明确修正案，将 Linux 系统排除在法案约束范围之外，此前原法案要求操作系统开发者收集并验证用户年龄数据的规定遭到了科技界的广泛反对。 这一调整保护了数千名非商业开源 Linux 贡献者，让他们无需承担无力负担的合规义务和潜在法律处罚，也为未来的科技监管避免伤害社区主导的开源项目提供了宝贵参考。 该法案的最初版本没有为开源操作系统设置任何豁免条款，这意味着分发未搭载强制年龄验证功能的标准 Linux 发行版的个人志愿开发者，将面临高额罚款的风险。

hackernews · rbanffy · 5月25日 18:19 · [社区讨论](https://news.ycombinator.com/item?id=48269961)

**背景**: 加州一直在制定新的互联网年龄验证规则，旨在防止未成年人访问网络上的有害成人内容。初始草案过于宽泛的措辞意外将监管要求延伸到了通用操作系统，远远超出了立法者最初打算针对的网站和服务范围。这类过度延伸的州级科技监管已经引起了全美隐私倡导者和开源团体的广泛批评。

**社区讨论**: 社区讨论呈现出多元观点：部分用户认为该监管规则可以简化为仅要求浏览器层面的家长控制检查，无需给整个操作系统增加负担；也有用户指出多数评论者并不了解法案的实际完整文本，还有不少人质疑这项争议性加州互联网立法的起草流程不透明、未征求相关行业意见。

**标签**: `#Linux`, `#Tech Regulation`, `#User Privacy`, `#Open Source`, `#California Legislation`

---

<a id="item-2"></a>
## [借助 AI 慢工出更优质的代码](https://nolanlawson.com/2026/05/25/using-ai-to-write-better-code-more-slowly/) ⭐️ 7.0/10

2026 年 5 月 25 日 Nolan Lawson 发布的文章提出了一种反直觉的 AI 编码工作流，通过延长迭代设计、代码生成和跨大模型互评的流程，产出质量远高于常规水平的生产级代码，即便总开发时长超过人工手写代码的耗时。 该工作流打破了大众普遍认为 AI 编码工具的核心价值仅在于提升开发速度的固有认知，为优先看重生产代码健壮性与长期可维护性、而非追求短期开发提速的工程团队提供了全新的可行实践路径。 这套工作流可在不同环节调用不同的专精大模型，例如用擅长生成的高性能模型编写代码，再用独立的快速评审模型查找边缘场景和隐藏漏洞，它也与 Cloudflare 公开的 AI 代码评审栈等现有行业实现相契合。

hackernews · signa11 · 5月25日 23:16 · [社区讨论](https://news.ycombinator.com/item?id=48272984)

**背景**: 传统的 AI 辅助编码工作流大多以缩短总开发时长为目标，让大模型快速生成代码草稿供工程师调整。近期关于大模型批判-优化循环、面向软件工程的大模型多智能体系统的学术研究已经证实，多步跨模型反馈可以大幅提升生成代码的最终输出质量。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://arxiv.org/html/2509.03463v2">The Impact of Critique on LLM-Based Model Generation from</a></li>
<li><a href="https://arxiv.org/html/2511.08475v1">Designing LLM-based Multi-Agent Systems for Software</a></li>

</ul>
</details>

**社区讨论**: 大部分参与讨论的资深工程师表示自己已经在工作中采用了类似的多模型迭代工作流，认为这种实践不会减少自身的思考投入，也不会导致技能退化，不过也有少数用户指出原文缺少具体的代码示例来展示这套工作流的实际效果。

**标签**: `#AI-assisted coding`, `#LLM development workflows`, `#software engineering practices`, `#AI code review`, `#developer productivity`

---

<a id="item-3"></a>
## [挪威部署 2PB 华为闪存用于本土 LLM 训练](https://www.blocksandfiles.com/flash/2026/05/22/norways-2-petabytes-of-huawei-flash-storage-and-llm-training/5244910) ⭐️ 7.0/10

挪威宣布计划部署 2PB 华为闪存存储，以支持其本土挪威语主权大语言模型训练项目，该举措已引发公众对项目成本效益和实施策略的广泛讨论。 该项目是针对代表性不足的欧洲小语种的典型国家主权 AI 基础设施建设尝试，为其他希望脱离全球大模型厂商依赖、建设本土语言 AI 能力的小型国家提供了参考案例。 该项目当前使用的本土高性能计算系统 Olivia 是 HPE Cray 超级计算机，仅配备 448 个 GPU 和 64512 个 CPU 核心，不少观察者认为该硬件不足以从头训练完整大模型，相比通过 LoRA 等方式微调现有开源模型效率要低得多。

hackernews · rbanffy · 5月25日 19:37 · [社区讨论](https://news.ycombinator.com/item?id=48270770)

**背景**: 主权大语言模型项目是国家级 AI 计划，目标是搭建完全由本土掌控的大语言模型，通常用于保障完整的数据溯源能力、本土语言支持，以及摆脱对境外 AI 服务提供商的依赖。近年来包括日本、印度在内的多个国家都已经推出了类似的主权 LLM 项目，以提升主流全球大模型中支持度较低的本土语言的适配水平。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://www.digitaldividedata.com/blog/enterprise-llm-training-services-build-buy-or-hybrid">Enterprise LLM Training Services: Build, Buy, Or Hybrid In 2026?</a></li>
<li><a href="https://startupmagazine.in/zoho-to-invest-200-million-in-gpu-infrastructure-for-sovereign-llm-project/">Zoho To Invest $200 Million In GPU Infrastructure For Sovereign</a></li>

</ul>
</details>

**社区讨论**: 参与讨论的 Hacker News 用户大多对该项目的实用性持怀疑态度，认为用有限硬件从头训练完整大模型是对公共资金的浪费，他们提出了更具成本效益的替代方案，包括将整理好的挪威语训练数据共享给现有前沿模型开发者，或是直接微调现有开源大模型而非从零训练。

**标签**: `#Sovereign AI`, `#LLM Training Infrastructure`, `#National AI Policy`, `#Underrepresented Language AI`, `#HPC Storage`

---

<a id="item-4"></a>
## [Mullvad 推出出口 IP 指纹识别缓解方案](https://mullvad.net/en/help/exit-ip-vpn-servers-mitigation-rollout) ⭐️ 7.0/10

知名隐私 VPN 服务商 Mullvad 已正式公开发布针对出口 IP 服务器指纹识别的全新缓解方案，解决了长期存在的相关用户隐私漏洞。 本次更新直接提升了数百万 Mullvad 用户的匿名保护水平，也为整个 VPN 行业对抗可去匿名化的追踪技术提供了新的参考标准。 该缓解方案扩大了分配给每台 Mullvad 服务器的可用出口 IP 地址池，消除了此前可让第三方轻易识别特定 Mullvad 服务器流量的少量可预测相邻 IP 组合。

hackernews · Cider9986 · 5月25日 17:45 · [社区讨论](https://news.ycombinator.com/item?id=48269580)

**背景**: 出口 IP 服务器指纹识别是网站和第三方观察者广泛使用的一种追踪技术，通过识别特定 VPN 服务器用于用户连接的少量固定 IP 地址集，判断流量是否来自该 VPN 服务器。Mullvad 是全球广受信任的隐私导向 VPN 服务商之一，此前每台服务器仅配置少量相邻出口 IP，使得这类指纹识别攻击的实施难度极低。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://discuss.privacyguides.net/t/mullvad-exit-ips-as-a-fingerprinting-vector/37910">Mullvad exit IPs as a fingerprinting vector - General - Privacy</a></li>
<li><a href="https://tmctmt.com/posts/mullvad-exit-ips-as-a-fingerprinting-vector/">Mullvad exit IPs as a fingerprinting vector | tmctmt</a></li>

</ul>
</details>

**社区讨论**: 本次公告对应的 Hacker News 社区讨论涉及多个话题，包括要求提供指向官方技术博客的清晰链接、对改进浏览器反指纹识别设计的建议、对 Mullvad 浏览器独有隐私特性的说明，以及关于 VPN 服务商如何向普通 ISP 支付出口点连接费用的疑问。

**标签**: `#Online Privacy`, `#VPN Technology`, `#IP Fingerprinting`, `#Cybersecurity Mitigation`, `#Mullvad`

---

<a id="item-5"></a>
## [Microsoft Copilot Cowork Exfiltrates Files](https://www.promptarmor.com/resources/microsoft-copilot-cowork-exfiltrates-files) ⭐️ 7.0/10

A security research report from PromptArmor demonstrates a flaw in Microsoft Copilot Cowork that allows unauthorized sensitive file exfiltration, spurring extensive community discussion about unaddressed security risks in production LLM agent deployments.

hackernews · Kneenex · 5月25日 21:45 · [社区讨论](https://news.ycombinator.com/item?id=48272354)

**标签**: `#AI Security`, `#Microsoft Copilot`, `#Prompt Injection`, `#Data Exfiltration`, `#LLM Agents`

---

<a id="item-6"></a>
## [教皇利奥十四世 AI 伦理通谕解读](https://simonwillison.net/2026/May/25/encyclical-on-ai/#atom-everything) ⭐️ 7.0/10

知名技术专家 Simon Willison 发布了他对梵蒂冈新发布的教皇利奥十四世 AI 伦理通谕《壮丽人性》的公开分析，指出这份面向 AI 时代的文档行文清晰易懂，且教皇选择利奥作为名号是为了致敬 19 世纪推动社会正义的教皇利奥十三世。 这份高关注度的梵蒂冈文件将对全球 AI 治理对话产生重要道德影响力，它与历史上著名的《新事物》社会正义框架一脉相承，为不同文化和宗教背景的群体讨论负责任 AI 部署提供了广受认可的易懂伦理基础。 这份长达 42300 词的通谕明确要求对 AI 驱动的自主武器施加最严格的伦理约束，警示 AI 对劳动者权益的负面影响，还准确描述了大语言模型的可解释性问题，指出现代 AI 系统是“培育”出来的而非开发者完全手动构建的。

rss · Simon Willison · 5月25日 23:58

**背景**: 1891 年教皇利奥十三世发布的《新事物》通谕，为第一次工业革命时期解决劳工权益和公平问题奠定了天主教社会训导的基础框架。新发布的《壮丽人性》通谕延续了这一社会正义传统，用于应对当前 AI 革命带来的独特伦理挑战，于 2026 年 5 月在梵蒂冈与 Anthropic 联合创始人 Chris Olah 共同亮相发布。

<details><summary>参考链接</summary>
<ul>
<li><a href="https://theconversation.com/pope-leo-warns-of-ais-risks-to-humanity-in-his-first-encyclical-283684">Pope Leo warns of AI ’s risks to humanity in his first encyclical</a></li>
<li><a href="https://www.nytimes.com/2026/05/25/world/europe/pope-leo-encyclical.html">Pope Leo Warns of Risks From A . I . in 42,300-Word Encyclical</a></li>
<li><a href="https://www.ncronline.org/vatican/vatican-news/pope-leo-anthropic-co-founder-call-church-tech-ethics-partnership-magnifica">Pope Leo, Anthropic co-founder call for church-tech ethics partnership...</a></li>

</ul>
</details>

**标签**: `#AI Ethics`, `#AI Governance`, `#Tech Policy`, `#Responsible AI`, `#Technical Commentary`

---

<a id="item-7"></a>
## [全新 Hacker News 首页浏览网页应用上线](https://thefrontpage.dev/) ⭐️ 6.0/10

新上线的网页应用 thefrontpage.dev 以响应式多栏布局展示 Hacker News 首页帖子，自带无限滚动功能，近期在 Hacker News 平台获得了 124 个点赞和 46 条详细反馈评论。 这款轻量小众网页工具为 Hacker News 的日常用户提供了更现代、内容密度更高的浏览体验，其开放的社区反馈循环也为从事内容聚合类 UI/UX 设计的前端开发者提供了宝贵的实践参考。 该应用会根据用户的视口尺寸自动调整栏数，但目前已知的问题包括默认正文字号过小、强制两端对齐的文本排版在窄视口下大幅降低可读性，以及当该页面本身登上 Hacker News 首页时会出现副标题滞后的有趣现象。

hackernews · thatxliner · 5月25日 20:12 · [社区讨论](https://news.ycombinator.com/item?id=48271127)

**背景**: Hacker News 是由 Y Combinator 运营的长期热门科技社区平台，其默认的单栏首页布局多年来基本保持不变。多年来社区成员开发了大量第三方替代浏览客户端，以自定义阅读体验适配不同用户的偏好。

**社区讨论**: 大部分用户称赞这款新应用的多栏布局和无限滚动功能，同时不少人指出了现存的痛点，包括字号过小、文本两端对齐导致可读性差、不同视口尺寸下的栏数切换阈值不够理想，还有多名用户调侃该应用本身出现在它所展示的 Hacker News 首页上的有趣“套娃”效应。

**标签**: `#Hacker News`, `#Web Utility`, `#Frontend Development`, `#UI/UX Design`, `#Community Platforms`

---

