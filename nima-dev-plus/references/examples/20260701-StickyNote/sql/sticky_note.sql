-- =====================================================
-- 用户便签表
-- 需求：门户便签功能 (20260701-StickyNote)
-- 作者：stone
-- 日期：2026-07-01
-- =====================================================

CREATE TABLE `sticky_note` (
  `id`          VARCHAR(32)  NOT NULL COMMENT '主键ID（雪花ID）',
  `user_id`     VARCHAR(32)  NOT NULL COMMENT '用户ID（JWT登录用户标识）',
  `content`     TEXT         NOT NULL DEFAULT '' COMMENT '便签内容',
  `create_time` DATETIME     DEFAULT NULL COMMENT '创建时间',
  `update_time` DATETIME     DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COMMENT ='用户便签表';
