class Pgbadger < Formula
  desc "Log analyzer for PostgreSQL"
  homepage "https://pgbadger.darold.net/"
  url "https://github.com/darold/pgbadger/archive/v11.2.tar.gz"
  sha256 "74527a09e2e68918d2714c55a776f8f19bba9dd62a9f49a3f5ffd59e0812bfa3"
  head "https://github.com/darold/pgbadger.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "cecce520a3c653ba69b24eae89587565569fc25191378622704fc3913452a3d6" => :catalina
    sha256 "cecce520a3c653ba69b24eae89587565569fc25191378622704fc3913452a3d6" => :mojave
    sha256 "1233f5007ae53bbcc82a3bce3a1f7be459494e2d33adb4652eb7e9c484e4baf9" => :high_sierra
  end

  def install
    system "perl", "Makefile.PL", "DESTDIR=#{buildpath}"
    system "make"
    system "make", "install"

    bin.install "usr/local/bin/pgbadger"
    man1.install "usr/local/share/man/man1/pgbadger.1p"
  end

  def caveats
    <<~EOS
      You must configure your PostgreSQL server before using pgBadger.
      Edit postgresql.conf (in #{var}/postgres if you use Homebrew's
      PostgreSQL), set the following parameters, and restart PostgreSQL:

        log_destination = 'stderr'
        log_line_prefix = '%t [%p]: [%l-1] user=%u,db=%d '
        log_statement = 'none'
        log_duration = off
        log_min_duration_statement = 0
        log_checkpoints = on
        log_connections = on
        log_disconnections = on
        log_lock_waits = on
        log_temp_files = 0
        lc_messages = 'C'
    EOS
  end

  test do
    (testpath/"server.log").write <<~EOS
      LOG:  autovacuum launcher started
      LOG:  database system is ready to accept connections
    EOS
    system bin/"pgbadger", "-f", "syslog", "server.log"
    assert_predicate testpath/"out.html", :exist?
  end
end
