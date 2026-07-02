# 关键词索引 HTML 模板（已废弃）

> **此文件已废弃**，保留仅作参考。

## 废弃原因

### 原因 1：关键词是机器数据，不需要 HTML

关键词索引是给 Agent 做需求知识图谱查询用的**机器数据**，存储在 `context.json` 的 `keywords` 字段中。Agent 做关键词匹配时读 `context.json` 即可，不需要解析 HTML。

### 原因 2：关键词应该是需求特征，不是实现细节

之前的关键词设计包含了大量实现细节（技术栈、模块路径），这些对需求关联匹配毫无价值。

**正确 vs 错误**：

```json
// ✅ 正确（需求特征）
{
  "domain": ["起始页", "工作台"],
  "pattern": ["工具嵌入", "弹窗交互", "实时保存"],
  "scenario": ["个人效率", "快速操作"],
  "concept": ["便签", "备忘"]
}

// ❌ 错误（实现细节）
{
  "business": ["门户", "JWT认证"],
  "feature": ["防抖", "用户隔离"],
  "tech": ["Vue3", "Jeecg-boot"],
  "module": ["{项目技术名}", "{模块名}"]
}
```

## 正确做法

- 关键词存储：`context.json` → `keywords: { domain, pattern, scenario, concept }`
- 关键词搜索：遍历 `{storyWorkspace}/*/context.json` 对比 `keywords` 字段
- 关联需求：`context.json` → `relatedStories: [{ storyId, nameCN, linkBy }]`
- 知识吸收：筑基阶段发现关联需求后，读取其总结文档吸收上下文
