<?php namespace Cadon\Stunring\Models;

use Model;

/**
 * Model
 */
class ProductAttribute extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'cadon_stunring_product_attributes';

    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public $hasMany = [
        'values' => ['Cadon\Stunring\Models\AttributeValue', 'key' => 'attribute_id']
    ];

    public function getAttributeIdOptions()
    {
        return Attribute::all()->pluck('attribute_name', 'id')->toArray();
    }

    public function getValueIdOptions()
    {
        return AttributeValue::all()->pluck('value', 'id')->toArray();
    }

    public function beforeCreate () {
        $this->product_id = request()->input('Product.id');
    }
}
