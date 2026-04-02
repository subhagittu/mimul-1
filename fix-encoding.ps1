# Fix encoding for all HTML files - use UTF-8 with BOM
$baseDir = "c:\Users\KIIT\Downloads\New folder (2)"

# Standard full footer matching the main page  
$standardFooter = @"
<footer class="modern-footer">
  <div class="footer-main">
    <div class="footer-col">
      <h4>Information</h4>
      <a href="main page mimul.html">Home</a>
      <a href="profile mimul.html">Profile</a>
      <a href="chairman message.html">Chairman Message</a>
      <a href="board of directors.html">Board of Directors</a>
      <a href="values.html">Values</a>
      <a href="our team.html">Our Team</a>
      <a href="tender.html">Tender</a>
      <a href="notice_circular.html">Notice / Circular</a>
      <a href="photos mimul.html">Photos</a>
      <a href="videos mimul.html">Videos</a>
    </div>
    <div class="footer-col">
      <h4>Our Products</h4>
      <a href="medini products milk.html">`u{2192} Milk</a>
      <a href="mesini products ghee.html">`u{2192} Ghee</a>
      <a href="medini products doi.html">`u{2192} Doi</a>
      <a href="medini products paneer.html">`u{2192} Paneer</a>
      <a href="medini products lassi.html">`u{2192} Lassi</a>
      <a href="medini products peda.html">`u{2192} Peda</a>
      <br>
      <h4>Useful Links</h4>
      <a href="http://www.paschimmedinipur.gov.in/" target="_blank">`u{2192} paschimmedinipur.gov.in</a>
      <a href="http://www.benmilk.com/" target="_blank">`u{2192} benmilk.com</a>
      <a href="http://www.nddb.coop/" target="_blank">`u{2192} nddb.coop</a>
    </div>
    <div class="footer-col">
      <h4>Reach Us</h4>
      <p><strong>HEADQUARTER</strong><br>
      <strong>The Midnapore Co-operative Milk Producers' Union Ltd.</strong><br>
      Ashoknagar, Midnapore, Dist.-Paschim Medinipur, Pin-721101. West Bengal</p>
      <iframe src="./main page mimul_files/embed.html" width="100%" height="180" style="border:0;" allowfullscreen loading="lazy"></iframe>
    </div>
    <div class="footer-col">
      <h4>Contact Info</h4>
      <p>`u{1F4DE} PHONE<br><a href="tel:03222275697" class="footer-phone">+91-03222 275697</a></p>
      <p>`u{1F4F1} HELPLINE<br><a href="tel:09476110259" class="footer-phone">+91 94761 10259</a></p>
      <p>`u{1F4F1} CUSTOMER CARE<br><a href="tel:09475396977" class="footer-phone">+91 94753 96977</a></p>
      <p>`u{2709}`u{FE0F} EMAIL<br><a href="mailto:sales@mimulmilk.in" class="footer-phone">sales@mimulmilk.in</a></p>
      <p>FOLLOW ON</p>
      <div class="footer-social">
        <a href="https://www.facebook.com/mimul.milk" target="_blank"><img src="./main page mimul_files/113039mimul_facebook.png" alt="Facebook"></a>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <p>`u{00A9} 2024 The Midnapore Co-operative Milk Producers' Union Ltd. | Powered by calcuttayellowpages.com</p>
  </div>
</footer>
"@

$files = @(
    "chairman message.html",
    "board of directors.html",
    "values.html",
    "our team.html",
    "profile mimul.html",
    "medini products milk.html",
    "mesini products ghee.html",
    "medini products doi.html",
    "medini products paneer.html",
    "medini products lassi.html",
    "medini products peda.html",
    "tender.html",
    "notice_circular.html",
    "photos mimul.html",
    "videos mimul.html",
    "read more part 1 main page.html",
    "read more part 2 main page.html"
)

$utf8NoBom = New-Object System.Text.UTF8Encoding $false

foreach ($file in $files) {
    $filePath = Join-Path $baseDir $file
    if (Test-Path $filePath) {
        $bytes = [System.IO.File]::ReadAllBytes($filePath)
        $content = [System.Text.Encoding]::UTF8.GetString($bytes)
        # Replace everything from <footer class="modern-footer"> to </footer>
        $pattern = '(?s)<footer class="modern-footer">.*?</footer>'
        $newContent = [regex]::Replace($content, $pattern, $standardFooter)
        [System.IO.File]::WriteAllBytes($filePath, $utf8NoBom.GetBytes($newContent))
        Write-Host "Fixed: $file"
    }
}

Write-Host "`nAll files re-encoded properly!"
