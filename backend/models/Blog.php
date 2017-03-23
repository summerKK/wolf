<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\Expression;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "blog".
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property integer $views
 * @property integer $is_delete
 * @property string $created_at
 * @property string $updated_at
 */
class Blog extends \yii\db\ActiveRecord
{

    public $category;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'blog';
    }

    public function init()
    {
        parent::init();
        $this->on(self::EVENT_BEFORE_INSERT, [$this, 'onBeforeInsert']);
        $this->on(self::EVENT_AFTER_INSERT, [$this, 'onAfterInsert']);
    }

    public function onBeforeInsert($event)
    {
        Yii::info('before insert');
    }

    public function onAfterInsert($event)
    {
        Yii::info('after insert');
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['content', 'category'], 'required'],
            [['views', 'is_delete'], 'integer'],
            [['content'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['title'], 'string', 'max' => 100],
        ];
    }

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'value' => new Expression('NOW()'),
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id'         => 'ID',
            'title'      => '标题',
            'content'    => '内容',
            'views'      => '点击量',
            'is_delete'  => '删除',
            'created_at' => '添加时间',
            'updated_at' => '更新时间',
        ];
    }

    public static function dropDownList()
    {
        $arr = [
            [
                'id'   => 1,
                'name' => '删除',
            ],
            [
                'id'   => 2,
                'name' => '保留',
            ],
        ];

        return ArrayHelper::map($arr, 'id', 'name');
    }

}
