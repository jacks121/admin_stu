<?php namespace Cadon\Stunring\Models;

use Model;

/**
 * Model
 */
class Attribute extends Model
{
    use \October\Rain\Database\Traits\Validation;
    use \October\Rain\Database\Traits\SoftDelete;

    /**
     * @var array dates to cast from the database.
     */
    protected $dates = ['deleted_at'];

    /**
     * @var string table in the database used by the model.
     */
    public $table = 'cadon_stunring_attributes';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $hasMany = [
        'attribute_values' => ['Cadon\Stunring\Models\AttributeValue', 'key' => 'attribute_id']
    ];
}
