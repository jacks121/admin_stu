<?php

namespace Cadon\Stunring\Updates;

use Illuminate\Database\Seeder;
use Cadon\Stunring\Models\Category;

class CategorySeeder extends Seeder
{
    public function run()
    {
        $categoryData = [
            [1, 0, 'Wedding', '/wedding.html', null, null, null],
            [2, 1, 'Engagement Rings', '/wedding/engagement-rings.html', null, null, null],
            [3, 1, 'Wedding Band', '/wedding/wedding-band.html', null, null, null],
            [4, 1, 'Wedding Set', '/wedding/wedding-set.html', null, null, null],
            [5, 1, 'Wedding Rings', '/wedding/wedding-rings.html', null, null, null],
            [6, 1, 'Jewelry Set', '/wedding/jewelry-set.html', null, null, null],
            [7, 1, 'Gift Packaging', '/wedding/gift-packaging.html', null, null, null],
            [8, 0, 'Earrings', '/earrings.html', null, null, null],
            [9, 8, 'Studs', '/earrings/studs.html', null, null, null],
            [10, 8, 'Drops', '/earrings/drops.html', null, null, null],
            [11, 8, 'Hoops', '/earrings/hoops.html', null, null, null],
            [12, 0, 'Necklaces', '/necklaces.html', null, null, null],
            [13, 12, 'Pendants', '/necklaces/pendants.html', null, null, null],
            [14, 12, 'Chokers & Tennis Necklace', '/necklaces/chokers-tennis-necklace.html', null, null, null],
            [15, 12, 'Lariat & Y Necklace', '/necklaces/lariat-y-necklace.html', null, null, null],
            [16, 12, 'Layered Necklace', '/necklaces/layered-necklace.html', null, null, null],
            [17, 12, 'Pear Necklace', '/necklaces/statement-necklace.html', null, null, null],
            [18, 0, 'Bracelets', '/bracelets.html', null, null, null],
            [19, 0, 'Men\'s', '/men.html', null, null, null],
            [20, 19, 'Men\'s Rings', '/men/men-s-rings.html', null, null, null],
            [21, 19, 'Men\'s Necklaces', '/men/men-s-necklaces.html', null, null, null],
            [22, 19, 'Cufflinks', '/men/cufflinks.html', null, null, null],
            [23, 0, 'COLLECTION', '/collection.html', null, null, null],
            [24, 23, 'Back to School', '/collection/back-to-school.html', null, null, null],
            [25, 23, 'The Spirit Snake', '/collection/the-spirit-snake.html', null, null, null],
            [26, 23, 'The Vintage Art Deco', '/collection/the-vintage-art-deco-ring.html', null, null, null],
            [27, 23, 'The Snow Band Ring', '/collection/the-snow-band-ring.html', null, null, null],
            [28, 23, 'The Starry Night', '/collection/the-starry-night.html', null, null, null],
            [29, 23, 'Mother\'s Day', '/collection/mother-s-day.html', null, null, null],
            [30, 23, 'Merry Christmas', '/collection/merry-christmas.html', null, null, null],
            [31, 23, 'Father\'s Day', '/collection/father-s-day.html', null, null, null],
        ];

        foreach ($categoryData as $data) {
            Category::create([
                'id' => $data[0],
                'parent_id' => $data[1],
                'category_name' => $data[2],
                'url' => $data[3],
                'created_at' => $data[4],
                'updated_at' => $data[5],
                'deleted_at' => $data[6],
            ]);
        }
    }
}
