
# Standard full footer matching the main page
$standardFooter = @'
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
      <a href="medini products milk.html">→ Milk</a>
      <a href="mesini products ghee.html">→ Ghee</a>
      <a href="medini products doi.html">→ Doi</a>
      <a href="medini products paneer.html">→ Paneer</a>
      <a href="medini products lassi.html">→ Lassi</a>
      <a href="medini products peda.html">→ Peda</a>
      <br>
      <h4>Useful Links</h4>
      <a href="http://www.paschimmedinipur.gov.in/" target="_blank">→ paschimmedinipur.gov.in</a>
      <a href="http://www.benmilk.com/" target="_blank">→ benmilk.com</a>
      <a href="http://www.nddb.coop/" target="_blank">→ nddb.coop</a>
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
      <p>📞 PHONE<br><a href="tel:03222275697" class="footer-phone">+91-03222 275697</a></p>
      <p>📱 HELPLINE<br><a href="tel:09476110259" class="footer-phone">+91 94761 10259</a></p>
      <p>📱 CUSTOMER CARE<br><a href="tel:09475396977" class="footer-phone">+91 94753 96977</a></p>
      <p>✉️ EMAIL<br><a href="mailto:sales@mimulmilk.in" class="footer-phone">sales@mimulmilk.in</a></p>
      <p>FOLLOW ON</p>
      <div class="footer-social">
        <a href="https://www.facebook.com/mimul.milk" target="_blank"><img src="./main page mimul_files/113039mimul_facebook.png" alt="Facebook"></a>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <p>© 2024 The Midnapore Co-operative Milk Producers' Union Ltd. | Powered by calcuttayellowpages.com</p>
  </div>
</footer>
'@

# List of files to update (all except main page which already has the full footer)
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

$baseDir = "c:\Users\KIIT\Downloads\New folder (2)"

foreach ($file in $files) {
    $filePath = Join-Path $baseDir $file
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw -Encoding UTF8
        # Replace everything from <footer class="modern-footer"> to </footer>
        $pattern = '<footer class="modern-footer">[\s\S]*?</footer>'
        $newContent = $content -replace $pattern, $standardFooter
        Set-Content -Path $filePath -Value $newContent -Encoding UTF8 -NoNewline
        Write-Host "✅ Updated: $file"
    } else {
        Write-Host "❌ Not found: $file"
    }
}

Write-Host "`n🎉 All footers standardized!"
