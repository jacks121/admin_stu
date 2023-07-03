<?php namespace Cadon\Stunring\Models;

use Model;

/**
 * Model
 */
class AdvertisementItem extends Model
{
    use \October\Rain\Database\Traits\Validation;


    /**
     * @var string table in the database used by the model.
     */
    public $table = 'cadon_stunring_advertisement_items';

    public $casts = [
        'advertisement_images' => 'array'
    ];
    /**
     * @var array rules for validation.
     */
    public $rules = [
    ];

    public function getAdvertisementIdOptions()
    {
        return \Cadon\Stunring\Models\Advertisement::pluck('code', 'id');
    }

}
