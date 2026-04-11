#!/bin/bash
# ============================================================
# Ready Equipment - Landing Page Generator
# ============================================================
# Usage:
#   ./new-page.sh
#
# The script will walk you through creating a new landing page.
# It uses template.html and fills in all the placeholders.
# ============================================================

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE="$SCRIPT_DIR/template.html"

if [ ! -f "$TEMPLATE" ]; then
  echo "Error: template.html not found in $SCRIPT_DIR"
  exit 1
fi

echo ""
echo "========================================"
echo "  Ready Equipment - New Landing Page"
echo "========================================"
echo ""

# --- City & State ---
read -p "City name (e.g., Laconia): " CITY
read -p "State abbreviation (e.g., NH): " STATE
read -p "Full state name (e.g., New Hampshire): " STATE_FULL
read -p "Region description (e.g., central New Hampshire): " REGION

# --- Equipment Type ---
echo ""
echo "Equipment type presets:"
echo "  1) Lift Rentals (scissor lifts, boom lifts, towable lifts)"
echo "  2) Excavator Rentals (mini excavators, skid steers)"
echo "  3) General Equipment Rentals"
echo "  4) Custom"
read -p "Choose [1-4]: " EQUIP_CHOICE

case $EQUIP_CHOICE in
  1)
    EQUIPMENT_TYPE="Lift Rentals"
    EQUIPMENT_LOWER="lift rentals"
    RENTAL_URL="https://rent.readyeq.com/items/mobile-elevated-work-platform"
    RENTAL_CATEGORY="mobile-elevated-work-platform"
    SERVICE_TYPES='"Scissor Lift Rental", "Boom Lift Rental", "Aerial Lift Rental", "Equipment Rental"'
    HERO_DESCRIPTION="Scissor lifts, boom lifts, and aerial equipment delivered directly to your ${CITY} job site. Daily, weekly, and monthly rates."
    EQUIPMENT_SECTION_SUB="From tight indoor spaces to 60+ foot outdoor reaches, we have the right lift for your project."
    EQUIPMENT_CARDS=$(cat <<'CARDS_EOF'
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_vukbfoc5frcj_Image45jpeg_1752777024315/public" alt="Scissor Lift available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Scissor Lifts</h3>
            <p>Electric and rough-terrain scissor lifts for indoor and outdoor work. Platform heights from 19' to 40'. Perfect for warehouse work, painting, electrical, and HVAC.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_vhfynfcw7orl_Image47jpeg_1752777477910/public" alt="Boom Lift available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Boom Lifts</h3>
            <p>Articulating and telescopic boom lifts for jobs that need reach and flexibility. Working heights up to 60'+. Ideal for tree work, construction, and building maintenance.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_tkat2329kuub_Image1jpeg_1752629757819/public" alt="Towable Lift available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Towable Lifts</h3>
            <p>Trailer-mounted lifts you can tow to any site with a standard hitch. Great for contractors who move between jobs. Heights up to 50'.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
CARDS_EOF
)
    ;;
  2)
    EQUIPMENT_TYPE="Excavator Rentals"
    EQUIPMENT_LOWER="excavator rentals"
    RENTAL_URL="https://rent.readyeq.com/items/earthmoving"
    RENTAL_CATEGORY="earthmoving"
    SERVICE_TYPES='"Mini Excavator Rental", "Skid Steer Rental", "Earthmoving Equipment Rental"'
    HERO_DESCRIPTION="Mini excavators, skid steers, and earthmoving equipment delivered directly to your ${CITY} job site. Daily, weekly, and monthly rates."
    EQUIPMENT_SECTION_SUB="From compact mini excavators to full-size skid steers, we have the right machine for your project."
    EQUIPMENT_CARDS=$(cat <<'CARDS_EOF'
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_t5bbad8ozr2t_19ScissorLift_1750184152265/public" alt="Mini Excavator available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Mini Excavators</h3>
            <p>Compact excavators for digging, trenching, and grading. Perfect for residential projects, utility work, and landscaping in tight spaces.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_t5bbad8ozr2t_19ScissorLift_1750184152265/public" alt="Skid Steer available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Skid Steers</h3>
            <p>Versatile skid steer loaders with multiple attachment options. Great for grading, loading, demolition, and site prep.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_t5bbad8ozr2t_19ScissorLift_1750184152265/public" alt="Compact Track Loader available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Compact Track Loaders</h3>
            <p>Track loaders for soft or uneven terrain. Better traction and lower ground pressure than wheeled machines.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
CARDS_EOF
)
    ;;
  3)
    EQUIPMENT_TYPE="Equipment Rentals"
    EQUIPMENT_LOWER="equipment rentals"
    RENTAL_URL="https://rent.readyeq.com/items"
    RENTAL_CATEGORY=""
    SERVICE_TYPES='"Equipment Rental", "Tool Rental", "Construction Equipment Rental"'
    HERO_DESCRIPTION="Construction equipment, tools, and machinery delivered directly to your ${CITY} job site. Daily, weekly, and monthly rates."
    EQUIPMENT_SECTION_SUB="From earthmoving to aerial lifts to compaction, we have the equipment your project needs."
    EQUIPMENT_CARDS=$(cat <<'CARDS_EOF'
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_vukbfoc5frcj_Image45jpeg_1752777024315/public" alt="Aerial Lifts available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Aerial Lifts</h3>
            <p>Scissor lifts, boom lifts, and towable lifts for working at height. Indoor and outdoor options from 19' to 85'.</p>
            <a href="https://rent.readyeq.com/items/mobile-elevated-work-platform" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_t5bbad8ozr2t_19ScissorLift_1750184152265/public" alt="Earthmoving Equipment available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Earthmoving</h3>
            <p>Mini excavators, skid steers, and compact track loaders for digging, grading, and site work.</p>
            <a href="https://rent.readyeq.com/items/earthmoving" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <img src="https://imagedelivery.net/9zoJXM5exLIp-vatPpB_Pg/ax6ms7txvt6o_t5bbad8ozr2t_19ScissorLift_1750184152265/public" alt="Compaction Equipment available for rent in {{CITY}} {{STATE}}" class="equip-card-img">
          <div class="equip-card-body">
            <h3>Compaction &amp; More</h3>
            <p>Plate compactors, rollers, concrete tools, generators, and more. Browse our full inventory online.</p>
            <a href="https://rent.readyeq.com/items" class="rent-link">View All Equipment</a>
          </div>
        </div>
CARDS_EOF
)
    ;;
  4)
    read -p "Equipment type (e.g., Forklift Rentals): " EQUIPMENT_TYPE
    EQUIPMENT_LOWER=$(echo "$EQUIPMENT_TYPE" | tr '[:upper:]' '[:lower:]')
    read -p "Rental storefront URL (e.g., https://rent.readyeq.com/items/earthmoving): " RENTAL_URL
    read -p "Schema service types (comma-separated, e.g., Forklift Rental, Material Handling): " SERVICE_TYPES_RAW
    SERVICE_TYPES=$(echo "$SERVICE_TYPES_RAW" | sed 's/,/", "/g; s/^/"/; s/$/"/')
    read -p "Hero description (1-2 sentences): " HERO_DESCRIPTION
    read -p "Equipment section subtitle: " EQUIPMENT_SECTION_SUB
    echo ""
    echo "You'll need to manually edit the equipment cards in the generated file."
    echo "Look for the EQUIPMENT_CARDS section and update the 3 cards."
    EQUIPMENT_CARDS=$(cat <<'CARDS_EOF'
        <!-- TODO: Update these cards with your specific equipment -->
        <div class="equip-card">
          <div class="equip-card-body">
            <h3>Equipment Type 1</h3>
            <p>Description of first equipment type.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <div class="equip-card-body">
            <h3>Equipment Type 2</h3>
            <p>Description of second equipment type.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
        <div class="equip-card">
          <div class="equip-card-body">
            <h3>Equipment Type 3</h3>
            <p>Description of third equipment type.</p>
            <a href="{{RENTAL_URL}}" class="rent-link">View Availability</a>
          </div>
        </div>
CARDS_EOF
)
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac

# --- Nearby Towns ---
echo ""
echo "Enter nearby towns (one per line, empty line to finish):"
TOWNS=""
while true; do
  read -p "  Town: " TOWN
  [ -z "$TOWN" ] && break
  TOWNS="${TOWNS}            <li>${TOWN}</li>\n"
done

# --- Google Maps Embed ---
echo ""
echo "To get a Google Maps embed URL:"
echo "  1. Go to maps.google.com"
echo "  2. Search for '${CITY}, ${STATE}'"
echo "  3. Click Share > Embed a map > Copy the src URL"
echo ""
read -p "Paste the Google Maps embed src URL (or press Enter to skip): " MAP_URL
if [ -z "$MAP_URL" ]; then
  MAP_URL="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d90000!2d-71.5!3d43.5!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2s${CITY}%2C+${STATE}!5e0!3m2!1sen!1sus"
fi

# --- Generate filename ---
CITY_SLUG=$(echo "$CITY" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
STATE_SLUG=$(echo "$STATE" | tr '[:upper:]' '[:lower:]')
EQUIP_SLUG=$(echo "$EQUIPMENT_TYPE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
SLUG="${CITY_SLUG}-${STATE_SLUG}-${EQUIP_SLUG}"
FILENAME="${SLUG}.html"

echo ""
echo "Generating: $FILENAME"

# --- Build the page ---
# Replace equipment cards placeholders first (they contain {{}} too)
EQUIPMENT_CARDS=$(echo "$EQUIPMENT_CARDS" | sed "s|{{CITY}}|${CITY}|g; s|{{STATE}}|${STATE}|g; s|{{RENTAL_URL}}|${RENTAL_URL}|g")

# Start with template
cp "$TEMPLATE" "$SCRIPT_DIR/$FILENAME"

# Use a temp file for sed operations (macOS compatible)
TMPFILE=$(mktemp)

sed \
  -e "s|{{CITY}}|${CITY}|g" \
  -e "s|{{STATE}}|${STATE}|g" \
  -e "s|{{STATE_FULL}}|${STATE_FULL}|g" \
  -e "s|{{REGION}}|${REGION}|g" \
  -e "s|{{EQUIPMENT_TYPE}}|${EQUIPMENT_TYPE}|g" \
  -e "s|{{EQUIPMENT_LOWER}}|${EQUIPMENT_LOWER}|g" \
  -e "s|{{RENTAL_URL}}|${RENTAL_URL}|g" \
  -e "s|{{SLUG}}|${SLUG}|g" \
  -e "s|{{HERO_DESCRIPTION}}|${HERO_DESCRIPTION}|g" \
  -e "s|{{EQUIPMENT_SECTION_SUB}}|${EQUIPMENT_SECTION_SUB}|g" \
  -e "s|{{MAP_EMBED_URL}}|${MAP_URL}|g" \
  -e "s|{{SERVICE_TYPES}}|${SERVICE_TYPES}|g" \
  "$SCRIPT_DIR/$FILENAME" > "$TMPFILE"

mv "$TMPFILE" "$SCRIPT_DIR/$FILENAME"

# Replace equipment cards block
python3 -c "
import sys
with open('${SCRIPT_DIR}/${FILENAME}', 'r') as f:
    content = f.read()
cards = '''${EQUIPMENT_CARDS}'''
content = content.replace('        {{EQUIPMENT_CARDS}}', cards)
towns = '''$(echo -e "$TOWNS")'''
content = content.replace('            {{NEARBY_TOWNS}}\n', towns)
with open('${SCRIPT_DIR}/${FILENAME}', 'w') as f:
    f.write(content)
"

# --- Auto-update sitemap.xml ---
echo "Updating sitemap.xml..."
SITEMAP="$SCRIPT_DIR/sitemap.xml"
# Insert new URL entry before closing </urlset>
NEW_ENTRY="  <url>\n    <loc>https://locations.readyeq.com/${SLUG}.html</loc>\n    <lastmod>$(date +%Y-%m-%d)</lastmod>\n    <changefreq>monthly</changefreq>\n    <priority>1.0</priority>\n  </url>"
sed -i '' "s|</urlset>|${NEW_ENTRY}\n</urlset>|" "$SITEMAP"

# --- Auto-update cross-links ---
echo "Adding cross-links..."

# Build the new page's link HTML for inserting into existing pages
NEW_LINK="      <a href=\"${FILENAME}\" style=\"color: var(--blue); text-decoration: none; font-weight: 600; font-size: 0.95rem; display: inline-block; margin: 0.25rem 0.75rem;\">${EQUIPMENT_TYPE} in ${CITY}, ${STATE}</a>"

# Collect all existing landing page files (exclude template, index, and the new file)
EXISTING_PAGES=$(find "$SCRIPT_DIR" -maxdepth 1 -name "*.html" \
  ! -name "template.html" \
  ! -name "index.html" \
  ! -name "$FILENAME" \
  -type f)

# Build cross-links for the NEW page (links to all existing pages)
CROSS_LINKS=""
for PAGE in $EXISTING_PAGES; do
  PAGE_BASE=$(basename "$PAGE")
  # Extract the page title from the <title> tag
  PAGE_TITLE=$(sed -n 's/.*<title>\(.*\) | Ready Equipment<\/title>.*/\1/p' "$PAGE")
  if [ -n "$PAGE_TITLE" ]; then
    CROSS_LINKS="${CROSS_LINKS}      <a href=\"${PAGE_BASE}\" style=\"color: var(--blue); text-decoration: none; font-weight: 600; font-size: 0.95rem; display: inline-block; margin: 0.25rem 0.75rem;\">${PAGE_TITLE}</a>\n"
  fi
done

# Add cross-links section to the new page (before <!-- FOOTER -->)
if [ -n "$CROSS_LINKS" ]; then
  python3 -c "
content = open('${SCRIPT_DIR}/${FILENAME}').read()
links = '''${CROSS_LINKS}'''
section = '''  <!-- MORE SERVICE AREAS -->
  <section style=\"padding: 2.5rem 2rem; background: var(--gray-50); border-top: 1px solid var(--gray-200);\">
    <div class=\"container\" style=\"text-align: center;\">
      <h3 style=\"font-size: 1rem; text-transform: uppercase; letter-spacing: 0.05em; color: var(--gray-500); margin-bottom: 1rem;\">More Service Areas</h3>
''' + links + '''    </div>
  </section>

'''
content = content.replace('  <!-- FOOTER -->', section + '  <!-- FOOTER -->')
open('${SCRIPT_DIR}/${FILENAME}', 'w').write(content)
"
fi

# Add the new page's link to ALL existing pages
for PAGE in $EXISTING_PAGES; do
  if grep -q "More Service Areas" "$PAGE"; then
    # Page already has a cross-links section — add to it
    sed -i '' "s|</h3>|</h3>\n${NEW_LINK}|" "$PAGE"
    # Deduplicate (only keep first h3 replacement)
    # Actually sed replaces only the first match by default on macOS, so this is fine
  fi
done

# --- Auto-update index.html ---
echo "Updating index.html..."
INDEX="$SCRIPT_DIR/index.html"
NEW_INDEX_ENTRY="    <a href=\"${FILENAME}\" class=\"page-link\">\n      <h2>${EQUIPMENT_TYPE} in ${CITY}, ${STATE}</h2>\n      <p>${HERO_DESCRIPTION}</p>\n    </a>"
sed -i '' "s|<!-- Add new pages here as you create them -->|${NEW_INDEX_ENTRY}\n    <!-- Add new pages here as you create them -->|" "$INDEX"

echo ""
echo "========================================"
echo "  Page created: $FILENAME"
echo "========================================"
echo ""
echo "Auto-updated:"
echo "  - sitemap.xml (new entry added)"
echo "  - Cross-links (all pages now link to each other)"
echo "  - index.html (new listing added)"
echo ""
echo "Next steps:"
echo "  1. Review the page:  open $SCRIPT_DIR/$FILENAME"
echo "  2. Deploy:  git add -A && git commit -m 'Add ${CITY} ${EQUIPMENT_TYPE} page' && git push"
echo "  3. It'll be live at: https://locations.readyeq.com/${SLUG}"
echo ""
