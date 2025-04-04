const std = @import("std");

const package = "libarchive";
const version: std.SemanticVersion = .{
    .major = 3,
    .minor = 7,
    .patch = 7,
};
const version_string = std.fmt.comptimePrint("{}", .{version});

pub fn build(b: *std.Build) void {
    const upstream = b.dependency(package, .{});
    const zlib = b.dependency("zlib", .{});
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = package["lib".len..],
        .target = target,
        .optimize = optimize,
    });
    lib.root_module.linkLibrary(zlib.artifact("z"));
    lib.root_module.addCMacro("HAVE_CONFIG_H", "1");
    lib.root_module.addConfigHeader(b.addConfigHeader(.{
        .style = .{ .autoconf = upstream.path("config.h.in") },
    }, .{
        .ARCHIVE_ACL_DARWIN = null,
        .ARCHIVE_ACL_FREEBSD = null,
        .ARCHIVE_ACL_FREEBSD_NFS4 = null,
        .ARCHIVE_ACL_LIBACL = true,
        .ARCHIVE_ACL_LIBRICHACL = null,
        .ARCHIVE_ACL_SUNOS = null,
        .ARCHIVE_ACL_SUNOS_NFS4 = null,
        .ARCHIVE_CRYPTO_MD5_LIBC = null,
        .ARCHIVE_CRYPTO_MD5_LIBMD = null,
        .ARCHIVE_CRYPTO_MD5_LIBSYSTEM = null,
        .ARCHIVE_CRYPTO_MD5_MBEDTLS = null,
        .ARCHIVE_CRYPTO_MD5_NETTLE = null,
        .ARCHIVE_CRYPTO_MD5_OPENSSL = null,
        .ARCHIVE_CRYPTO_MD5_WIN = null,
        .ARCHIVE_CRYPTO_RMD160_LIBC = null,
        .ARCHIVE_CRYPTO_RMD160_LIBMD = null,
        .ARCHIVE_CRYPTO_RMD160_MBEDTLS = null,
        .ARCHIVE_CRYPTO_RMD160_NETTLE = null,
        .ARCHIVE_CRYPTO_RMD160_OPENSSL = null,
        .ARCHIVE_CRYPTO_SHA1_LIBC = null,
        .ARCHIVE_CRYPTO_SHA1_LIBMD = null,
        .ARCHIVE_CRYPTO_SHA1_LIBSYSTEM = null,
        .ARCHIVE_CRYPTO_SHA1_MBEDTLS = null,
        .ARCHIVE_CRYPTO_SHA1_NETTLE = null,
        .ARCHIVE_CRYPTO_SHA1_OPENSSL = null,
        .ARCHIVE_CRYPTO_SHA1_WIN = null,
        .ARCHIVE_CRYPTO_SHA256_LIBC = null,
        .ARCHIVE_CRYPTO_SHA256_LIBC2 = null,
        .ARCHIVE_CRYPTO_SHA256_LIBC3 = null,
        .ARCHIVE_CRYPTO_SHA256_LIBMD = null,
        .ARCHIVE_CRYPTO_SHA256_LIBSYSTEM = null,
        .ARCHIVE_CRYPTO_SHA256_MBEDTLS = null,
        .ARCHIVE_CRYPTO_SHA256_NETTLE = null,
        .ARCHIVE_CRYPTO_SHA256_OPENSSL = null,
        .ARCHIVE_CRYPTO_SHA256_WIN = null,
        .ARCHIVE_CRYPTO_SHA384_LIBC = null,
        .ARCHIVE_CRYPTO_SHA384_LIBC2 = null,
        .ARCHIVE_CRYPTO_SHA384_LIBC3 = null,
        .ARCHIVE_CRYPTO_SHA384_LIBSYSTEM = null,
        .ARCHIVE_CRYPTO_SHA384_MBEDTLS = null,
        .ARCHIVE_CRYPTO_SHA384_NETTLE = null,
        .ARCHIVE_CRYPTO_SHA384_OPENSSL = null,
        .ARCHIVE_CRYPTO_SHA384_WIN = null,
        .ARCHIVE_CRYPTO_SHA512_LIBC = null,
        .ARCHIVE_CRYPTO_SHA512_LIBC2 = null,
        .ARCHIVE_CRYPTO_SHA512_LIBC3 = null,
        .ARCHIVE_CRYPTO_SHA512_LIBMD = null,
        .ARCHIVE_CRYPTO_SHA512_LIBSYSTEM = null,
        .ARCHIVE_CRYPTO_SHA512_MBEDTLS = null,
        .ARCHIVE_CRYPTO_SHA512_NETTLE = null,
        .ARCHIVE_CRYPTO_SHA512_OPENSSL = null,
        .ARCHIVE_CRYPTO_SHA512_WIN = null,
        .ARCHIVE_XATTR_AIX = null,
        .ARCHIVE_XATTR_DARWIN = null,
        .ARCHIVE_XATTR_FREEBSD = null,
        .ARCHIVE_XATTR_LINUX = true,
        .BSDCAT_VERSION_STRING = version_string,
        .BSDCPIO_VERSION_STRING = version_string,
        .BSDTAR_VERSION_STRING = version_string,
        .BSDUNZIP_VERSION_STRING = version_string,
        .HAVE_ACE_T = null,
        .HAVE_ACL = null,
        .HAVE_ACLENT_T = null,
        .HAVE_ACL_ADD_FLAG_NP = null,
        .HAVE_ACL_ADD_PERM = true,
        .HAVE_ACL_CLEAR_FLAGS_NP = null,
        .HAVE_ACL_CLEAR_PERMS = true,
        .HAVE_ACL_CREATE_ENTRY = true,
        .HAVE_ACL_DELETE_DEF_FILE = true,
        .HAVE_ACL_ENTRY_T = true,
        .HAVE_ACL_FREE = true,
        .HAVE_ACL_GET_BRAND_NP = null,
        .HAVE_ACL_GET_ENTRY = true,
        .HAVE_ACL_GET_ENTRY_TYPE_NP = null,
        .HAVE_ACL_GET_FD = true,
        .HAVE_ACL_GET_FD_NP = null,
        .HAVE_ACL_GET_FILE = true,
        .HAVE_ACL_GET_FLAGSET_NP = null,
        .HAVE_ACL_GET_FLAG_NP = null,
        .HAVE_ACL_GET_LINK_NP = null,
        .HAVE_ACL_GET_PERM = true,
        .HAVE_ACL_GET_PERMSET = true,
        .HAVE_ACL_GET_PERM_NP = null,
        .HAVE_ACL_GET_QUALIFIER = true,
        .HAVE_ACL_GET_TAG_TYPE = true,
        .HAVE_ACL_INIT = true,
        .HAVE_ACL_IS_TRIVIAL_NP = null,
        .HAVE_ACL_LIBACL_H = true,
        .HAVE_ACL_PERMSET_T = true,
        .HAVE_ACL_SET_ENTRY_TYPE_NP = null,
        .HAVE_ACL_SET_FD = true,
        .HAVE_ACL_SET_FD_NP = null,
        .HAVE_ACL_SET_FILE = true,
        .HAVE_ACL_SET_LINK_NP = null,
        .HAVE_ACL_SET_QUALIFIER = true,
        .HAVE_ACL_SET_TAG_TYPE = true,
        .HAVE_ACL_T = true,
        .HAVE_ACL_TAG_T = true,
        .HAVE_ARC4RANDOM_BUF = null,
        .HAVE_ATTR_XATTR_H = true,
        .HAVE_BCRYPT_H = null,
        .HAVE_BLAKE2_H = null,
        .HAVE_BZLIB_H = null,
        .HAVE_CHFLAGS = null,
        .HAVE_CHOWN = true,
        .HAVE_CHROOT = true,
        .HAVE_CMTIME_S = null,
        .HAVE_COPYFILE_H = null,
        .HAVE_CTIME_R = true,
        .HAVE_CTYPE_H = true,
        .HAVE_CYGWIN_CONV_PATH = null,
        .HAVE_DECL_ACE_GETACL = null,
        .HAVE_DECL_ACE_GETACLCNT = null,
        .HAVE_DECL_ACE_SETACL = null,
        .HAVE_DECL_ACL_SYNCHRONIZE = null,
        .HAVE_DECL_ACL_TYPE_EXTENDED = null,
        .HAVE_DECL_ACL_TYPE_NFS4 = null,
        .HAVE_DECL_ACL_USER = null,
        .HAVE_DECL_EXTATTR_NAMESPACE_USER = false,
        .HAVE_DECL_GETACL = null,
        .HAVE_DECL_GETACLCNT = null,
        .HAVE_DECL_INT32_MAX = true,
        .HAVE_DECL_INT32_MIN = true,
        .HAVE_DECL_INT64_MAX = true,
        .HAVE_DECL_INT64_MIN = true,
        .HAVE_DECL_INTMAX_MAX = true,
        .HAVE_DECL_INTMAX_MIN = true,
        .HAVE_DECL_SETACL = null,
        .HAVE_DECL_SIZE_MAX = true,
        .HAVE_DECL_SSIZE_MAX = true,
        .HAVE_DECL_STRERROR_R = true,
        .HAVE_DECL_UINT32_MAX = true,
        .HAVE_DECL_UINT64_MAX = true,
        .HAVE_DECL_UINTMAX_MAX = true,
        .HAVE_DECL_XATTR_NOFOLLOW = false,
        .HAVE_DIRENT_H = true,
        .HAVE_DIRFD = true,
        .HAVE_DLFCN_H = true,
        .HAVE_DOPRNT = null,
        .HAVE_D_MD_ORDER = null,
        .HAVE_EFTYPE = null,
        .HAVE_EILSEQ = true,
        .HAVE_ERRNO_H = true,
        .HAVE_EXPAT_H = null,
        .HAVE_EXT2FS_EXT2_FS_H = null,
        .HAVE_EXTATTR_GET_FD = null,
        .HAVE_EXTATTR_GET_FILE = null,
        .HAVE_EXTATTR_GET_LINK = null,
        .HAVE_EXTATTR_LIST_FD = null,
        .HAVE_EXTATTR_LIST_FILE = null,
        .HAVE_EXTATTR_LIST_LINK = null,
        .HAVE_EXTATTR_SET_FD = null,
        .HAVE_EXTATTR_SET_LINK = null,
        .HAVE_FACL = null,
        .HAVE_FCHDIR = true,
        .HAVE_FCHFLAGS = null,
        .HAVE_FCHMOD = true,
        .HAVE_FCHOWN = true,
        .HAVE_FCNTL = true,
        .HAVE_FCNTL_H = true,
        .HAVE_FDOPENDIR = true,
        .HAVE_FGETEA = null,
        .HAVE_FGETXATTR = true,
        .HAVE_FLISTEA = null,
        .HAVE_FLISTXATTR = true,
        .HAVE_FNMATCH = true,
        .HAVE_FNMATCH_H = true,
        .HAVE_FORK = true,
        .HAVE_FSEEKO = true,
        .HAVE_FSETEA = null,
        .HAVE_FSETXATTR = true,
        .HAVE_FSTAT = true,
        .HAVE_FSTATAT = true,
        .HAVE_FSTATFS = true,
        .HAVE_FSTATVFS = true,
        .HAVE_FTRUNCATE = true,
        .HAVE_FUTIMENS = true,
        .HAVE_FUTIMES = true,
        .HAVE_FUTIMESAT = true,
        .HAVE_GETEA = null,
        .HAVE_GETEUID = true,
        .HAVE_GETGRGID_R = true,
        .HAVE_GETGRNAM_R = true,
        .HAVE_GETLINE = true,
        .HAVE_GETPID = true,
        .HAVE_GETPWNAM_R = true,
        .HAVE_GETPWUID_R = true,
        .HAVE_GETVFSBYNAME = null,
        .HAVE_GETXATTR = true,
        .HAVE_GMTIME_R = true,
        .HAVE_GMTIME_S = null,
        .HAVE_GRP_H = true,
        .HAVE_ICONV = true,
        .HAVE_ICONV_H = true,
        .HAVE_INTMAX_T = true,
        .HAVE_INTTYPES_H = true,
        .HAVE_IO_H = null,
        .HAVE_LANGINFO_H = true,
        .HAVE_LCHFLAGS = null,
        .HAVE_LCHMOD = true,
        .HAVE_LCHOWN = true,
        .HAVE_LGETEA = null,
        .HAVE_LGETXATTR = true,
        .HAVE_LIBACL = true,
        .HAVE_LIBB2 = true,
        .HAVE_LIBBZ2 = null,
        .HAVE_LIBCHARSET = null,
        .HAVE_LIBCRYPTO = null,
        .HAVE_LIBEXPAT = null,
        .HAVE_LIBLZ4 = null,
        .HAVE_LIBLZMA = null,
        .HAVE_LIBLZO2 = null,
        .HAVE_LIBMBEDCRYPTO = null,
        .HAVE_LIBMD = true,
        .HAVE_LIBNETTLE = null,
        .HAVE_LIBPCRE = null,
        .HAVE_LIBPCRE2 = null,
        .HAVE_LIBPCRE2_POSIX = null,
        .HAVE_LIBPCREPOSIX = null,
        .HAVE_LIBREGEX = null,
        .HAVE_LIBRICHACL = null,
        .HAVE_LIBXML2 = null,
        .HAVE_LIBXML_XMLREADER_H = null,
        .HAVE_LIBXML_XMLWRITER_H = null,
        .HAVE_LIBZSTD = null,
        .HAVE_LIMITS_H = true,
        .HAVE_LINK = true,
        .HAVE_LINKAT = true,
        .HAVE_LINUX_FIEMAP_H = true,
        .HAVE_LINUX_FS_H = true,
        .HAVE_LINUX_MAGIC_H = true,
        .HAVE_LINUX_TYPES_H = true,
        .HAVE_LISTEA = null,
        .HAVE_LISTXATTR = true,
        .HAVE_LLISTEA = null,
        .HAVE_LLISTXATTR = true,
        .HAVE_LOCALCHARSET_H = null,
        .HAVE_LOCALE_CHARSET = null,
        .HAVE_LOCALE_H = true,
        .HAVE_LOCALTIME_R = true,
        .HAVE_LOCALTIME_S = null,
        .HAVE_LONG_LONG_INT = true,
        .HAVE_LSETEA = null,
        .HAVE_LSETXATTR = true,
        .HAVE_LSTAT = true,
        .HAVE_LSTAT_EMPTY_STRING_BUG = null,
        .HAVE_LUTIMES = true,
        .HAVE_LZ4HC_H = null,
        .HAVE_LZ4_H = null,
        .HAVE_LZMA_FILTER_ARM64 = null,
        .HAVE_LZMA_H = null,
        .HAVE_LZMA_STREAM_ENCODER_MT = null,
        .HAVE_LZO_LZO1X_H = null,
        .HAVE_LZO_LZOCONF_H = null,
        .HAVE_MBEDTLS_AES_H = null,
        .HAVE_MBEDTLS_MD_H = null,
        .HAVE_MBEDTLS_PKCS5_H = null,
        .HAVE_MBRTOWC = true,
        .HAVE_MBR_GID_TO_UUID = null,
        .HAVE_MBR_UID_TO_UUID = null,
        .HAVE_MBR_UUID_TO_ID = null,
        .HAVE_MD5_H = true,
        .HAVE_MEMBERSHIP_H = null,
        .HAVE_MEMMOVE = true,
        .HAVE_MEMSET = true,
        .HAVE_MINIX_CONFIG_H = null,
        .HAVE_MKDIR = true,
        .HAVE_MKFIFO = true,
        .HAVE_MKNOD = true,
        .HAVE_MKSTEMP = true,
        .HAVE_NDIR_H = null,
        .HAVE_NETTLE_AES_H = null,
        .HAVE_NETTLE_HMAC_H = null,
        .HAVE_NETTLE_MD5_H = null,
        .HAVE_NETTLE_PBKDF2_H = null,
        .HAVE_NETTLE_RIPEMD160_H = null,
        .HAVE_NETTLE_SHA_H = null,
        .HAVE_NL_LANGINFO = true,
        .HAVE_OPENAT = true,
        .HAVE_OPENSSL_EVP_H = null,
        .HAVE_PATHS_H = true,
        .HAVE_PCRE2POSIX_H = null,
        .HAVE_PCREPOSIX_H = null,
        .HAVE_PIPE = true,
        .HAVE_PKCS5_PBKDF2_HMAC_SHA1 = null,
        .HAVE_POLL = true,
        .HAVE_POLL_H = true,
        .HAVE_POSIX_SPAWNP = true,
        .HAVE_PTHREAD_H = true,
        .HAVE_PWD_H = true,
        .HAVE_READDIR_R = true,
        .HAVE_READLINK = true,
        .HAVE_READLINKAT = true,
        .HAVE_READPASSPHRASE = null,
        .HAVE_READPASSPHRASE_H = null,
        .HAVE_REGEX_H = true,
        .HAVE_RICHACL_ALLOC = null,
        .HAVE_RICHACL_EQUIV_MODE = null,
        .HAVE_RICHACL_FREE = null,
        .HAVE_RICHACL_GET_FD = null,
        .HAVE_RICHACL_GET_FILE = null,
        .HAVE_RICHACL_SET_FD = null,
        .HAVE_RICHACL_SET_FILE = null,
        .HAVE_RIPEMD_H = true,
        .HAVE_SELECT = true,
        .HAVE_SETENV = true,
        .HAVE_SETLOCALE = true,
        .HAVE_SETXATTR = null,
        .HAVE_SHA256_H = true,
        .HAVE_SHA512_H = true,
        .HAVE_SHA_H = true,
        .HAVE_SIGACTION = true,
        .HAVE_SIGNAL_H = true,
        .HAVE_SPAWN_H = true,
        .HAVE_STATFS = true,
        .HAVE_STATVFS = true,
        .HAVE_STAT_EMPTY_STRING_BUG = null,
        .HAVE_STDARG_H = true,
        .HAVE_STDINT_H = true,
        .HAVE_STDIO_H = true,
        .HAVE_STDLIB_H = true,
        .HAVE_STRCHR = true,
        .HAVE_STRDUP = true,
        .HAVE_STRERROR = true,
        .HAVE_STRERROR_R = true,
        .HAVE_STRFTIME = true,
        .HAVE_STRINGS_H = true,
        .HAVE_STRING_H = true,
        .HAVE_STRNCPY_S = null,
        .HAVE_STRNLEN = true,
        .HAVE_STRRCHR = true,
        .HAVE_STRUCT_RICHACE = null,
        .HAVE_STRUCT_RICHACL = null,
        .HAVE_STRUCT_STATFS = null,
        .HAVE_STRUCT_STATFS_F_IOSIZE = null,
        .HAVE_STRUCT_STATFS_F_NAMEMAX = null,
        .HAVE_STRUCT_STATVFS_F_IOSIZE = null,
        .HAVE_STRUCT_STAT_ST_BIRTHTIME = null,
        .HAVE_STRUCT_STAT_ST_BIRTHTIMESPEC_TV_NSEC = null,
        .HAVE_STRUCT_STAT_ST_BLKSIZE = true,
        .HAVE_STRUCT_STAT_ST_FLAGS = null,
        .HAVE_STRUCT_STAT_ST_MTIMESPEC_TV_NSEC = null,
        .HAVE_STRUCT_STAT_ST_MTIME_N = null,
        .HAVE_STRUCT_STAT_ST_MTIME_USEC = null,
        .HAVE_STRUCT_STAT_ST_MTIM_TV_NSEC = true,
        .HAVE_STRUCT_STAT_ST_UMTIME = null,
        .HAVE_STRUCT_TM_TM_GMTOFF = true,
        .HAVE_STRUCT_TM___TM_GMTOFF = null,
        .HAVE_STRUCT_VFSCONF = null,
        .HAVE_STRUCT_XVFSCONF = null,
        .HAVE_SYMLINK = true,
        .HAVE_SYS_ACL_H = null,
        .HAVE_SYS_CDEFS_H = true,
        .HAVE_SYSCONF = false,
        .HAVE_SYS_DIR_H = null,
        .HAVE_SYS_EA_H = null,
        .HAVE_SYS_EXTATTR_H = null,
        .HAVE_SYS_IOCTL_H = true,
        .HAVE_SYS_MKDEV_H = null,
        .HAVE_SYS_MOUNT_H = true,
        .HAVE_SYS_NDIR_H = null,
        .HAVE_SYS_PARAM_H = true,
        .HAVE_SYS_POLL_H = true,
        .HAVE_SYS_RICHACL_H = null,
        .HAVE_SYS_SELECT_H = true,
        .HAVE_SYS_STATFS_H = true,
        .HAVE_SYS_STATVFS_H = true,
        .HAVE_SYS_STAT_H = true,
        .HAVE_SYS_SYSMACROS_H = true,
        .HAVE_SYS_TIME_H = true,
        .HAVE_SYS_TYPES_H = true,
        .HAVE_SYS_UTIME_H = null,
        .HAVE_SYS_UTSNAME_H = true,
        .HAVE_SYS_VFS_H = true,
        .HAVE_SYS_WAIT_H = true,
        .HAVE_SYS_XATTR_H = true,
        .HAVE_TIMEGM = true,
        .HAVE_TIME_H = true,
        .HAVE_TZSET = true,
        .HAVE_UINTMAX_T = true,
        .HAVE_UNISTD_H = true,
        .HAVE_UNLINKAT = true,
        .HAVE_UNSETENV = true,
        .HAVE_UNSIGNED_LONG_LONG = true,
        .HAVE_UNSIGNED_LONG_LONG_INT = true,
        .HAVE_UTIME = true,
        .HAVE_UTIMENSAT = true,
        .HAVE_UTIMES = true,
        .HAVE_UTIME_H = true,
        .HAVE_VFORK = true,
        .HAVE_VPRINTF = true,
        .HAVE_WCHAR_H = true,
        .HAVE_WCHAR_T = true,
        .HAVE_WCRTOMB = true,
        .HAVE_WCSCMP = true,
        .HAVE_WCSCPY = true,
        .HAVE_WCSLEN = true,
        .HAVE_WCTOMB = true,
        .HAVE_WCTYPE_H = true,
        .HAVE_WINCRYPT_H = null,
        .HAVE_WINDOWS_H = null,
        .HAVE_WINIOCTL_H = null,
        .HAVE_WMEMCMP = true,
        .HAVE_WMEMCPY = true,
        .HAVE_WMEMMOVE = true,
        .HAVE_WORKING_EXT2_IOC_GETFLAGS = true,
        .HAVE_WORKING_FS_IOC_GETFLAGS = true,
        .HAVE_ZLIB_H = true,
        .HAVE_ZSTD_H = null,
        .HAVE_ZSTD_compressStream = null,
        .HAVE__FSEEKI64 = null,
        .HAVE__GET_TIMEZONE = null,
        .HAVE__MKGMTIME = null,
        .ICONV_CONST = {},
        .LIBARCHIVE_VERSION_NUMBER = std.fmt.comptimePrint("{d}{d:0>3}{d:0>3}", .{
            version.major, version.minor, version.patch,
        }),
        .LIBARCHIVE_VERSION_STRING = version_string,
        .LSTAT_FOLLOWS_SLASHED_SYMLINK = true,
        .LT_OBJDIR = ".libs/",
        .MAJOR_IN_MKDEV = null,
        .MAJOR_IN_SYSMACROS = true,
        .NTDDI_VERSION = null,
        .PACKAGE = package,
        .PACKAGE_BUGREPORT = package ++ "-discuss@googlegroups.com",
        .PACKAGE_NAME = package,
        .PACKAGE_STRING = b.fmt("{s} {}", .{ package, version }),
        .PACKAGE_TARNAME = package,
        .PACKAGE_URL = "",
        .PACKAGE_VERSION = version_string,
        .PCRE2_STATIC = null,
        .PCRE_STATIC = null,
        .SIZEOF_INT = target.result.cTypeByteSize(.int),
        .SIZEOF_LONG = target.result.cTypeByteSize(.long),
        .SIZEOF_WCHAR_T = @as(u3, switch (target.result.os.tag) {
            .windows => 2,
            else => 4,
        }),
        .STDC_HEADERS = true,
        .STRERROR_R_CHAR_P = true,
        ._ALL_SOURCE = true,
        ._DARWIN_C_SOURCE = true,
        .__EXTENSIONS__ = true,
        ._GNU_SOURCE = true,
        ._HPUX_ALT_XOPEN_SOCKET_API = true,
        ._MINIX = null,
        ._NETBSD_SOURCE = true,
        ._OPENBSD_SOURCE = true,
        ._POSIX_SOURCE = null,
        ._POSIX_1_SOURCE = null,
        ._POSIX_PTHREAD_SEMANTICS = true,
        .__STDC_WANT_IEC_60559_ATTRIBS_EXT__ = true,
        .__STDC_WANT_IEC_60559_BFP_EXT__ = true,
        .__STDC_WANT_IEC_60559_DFP_EXT__ = true,
        .__STDC_WANT_IEC_60559_FUNCS_EXT__ = true,
        .__STDC_WANT_IEC_60559_TYPES_EXT__ = true,
        .__STDC_WANT_LIB_EXT2__ = true,
        .__STDC_WANT_MATH_SPEC_FUNCS__ = true,
        ._TANDEM_SOURCE = true,
        ._XOPEN_SOURCE = null,
        .VERSION = version_string,
        .WINVER = null,
        ._FILE_OFFSET_BITS = null,
        ._LARGEFILE_SOURCE = null,
        ._LARGE_FILES = null,
        ._UINT32_T = null,
        ._UINT64_T = null,
        ._UINT8_T = null,
        ._WIN32_WINNT = null,
        .__LIBARCHIVE_CONFIG_H_INCLUDED = true,
        .@"const" = null,
        .gid_t = null,
        .id_t = null,
        .int16_t = null,
        .int32_t = null,
        .int64_t = null,
        .intmax_t = null,
        .mode_t = null,
        .off_t = null,
        .size_t = null,
        .uid_t = null,
        .uint16_t = null,
        .uint32_t = null,
        .uint64_t = null,
        .uint8_t = null,
        .uintmax_t = null,
        .uintptr_t = null,
    }));
    lib.root_module.addCSourceFiles(.{
        .root = upstream.path("libarchive"),
        .files = &.{
            "archive_acl.c",
            "archive_check_magic.c",
            "archive_cmdline.c",
            "archive_cryptor.c",
            "archive_digest.c",
            "archive_entry.c",
            "archive_entry_copy_stat.c",
            "archive_entry_link_resolver.c",
            "archive_entry_sparse.c",
            "archive_entry_stat.c",
            "archive_entry_strmode.c",
            "archive_entry_xattr.c",
            "archive_getdate.c",
            "archive_hmac.c",
            "archive_match.c",
            "archive_options.c",
            "archive_pack_dev.c",
            "archive_pathmatch.c",
            "archive_ppmd8.c",
            "archive_ppmd7.c",
            "archive_random.c",
            "archive_rb.c",
            "archive_read.c",
            "archive_read_add_passphrase.c",
            "archive_read_append_filter.c",
            "archive_read_data_into_fd.c",
            "archive_read_disk_entry_from_file.c",
            "archive_read_disk_posix.c",
            "archive_read_disk_set_standard_lookup.c",
            "archive_read_extract.c",
            "archive_read_extract2.c",
            "archive_read_open_fd.c",
            "archive_read_open_file.c",
            "archive_read_open_filename.c",
            "archive_read_open_memory.c",
            "archive_read_set_format.c",
            "archive_read_set_options.c",
            "archive_read_support_filter_all.c",
            "archive_read_support_filter_by_code.c",
            "archive_read_support_filter_bzip2.c",
            "archive_read_support_filter_compress.c",
            "archive_read_support_filter_gzip.c",
            "archive_read_support_filter_grzip.c",
            "archive_read_support_filter_lrzip.c",
            "archive_read_support_filter_lz4.c",
            "archive_read_support_filter_lzop.c",
            "archive_read_support_filter_none.c",
            "archive_read_support_filter_program.c",
            "archive_read_support_filter_rpm.c",
            "archive_read_support_filter_uu.c",
            "archive_read_support_filter_xz.c",
            "archive_read_support_filter_zstd.c",
            "archive_read_support_format_7zip.c",
            "archive_read_support_format_all.c",
            "archive_read_support_format_ar.c",
            "archive_read_support_format_by_code.c",
            "archive_read_support_format_cab.c",
            "archive_read_support_format_cpio.c",
            "archive_read_support_format_empty.c",
            "archive_read_support_format_iso9660.c",
            "archive_read_support_format_lha.c",
            "archive_read_support_format_mtree.c",
            "archive_read_support_format_rar.c",
            "archive_read_support_format_rar5.c",
            "archive_read_support_format_raw.c",
            "archive_read_support_format_tar.c",
            "archive_read_support_format_warc.c",
            "archive_read_support_format_xar.c",
            "archive_read_support_format_zip.c",
            "archive_string.c",
            "archive_string_sprintf.c",
            "archive_util.c",
            "archive_version_details.c",
            "archive_virtual.c",
            "archive_write.c",
            "archive_write_disk_posix.c",
            "archive_write_disk_set_standard_lookup.c",
            "archive_write_open_fd.c",
            "archive_write_open_file.c",
            "archive_write_open_filename.c",
            "archive_write_open_memory.c",
            "archive_write_add_filter.c",
            "archive_write_add_filter_b64encode.c",
            "archive_write_add_filter_by_name.c",
            "archive_write_add_filter_bzip2.c",
            "archive_write_add_filter_compress.c",
            "archive_write_add_filter_grzip.c",
            "archive_write_add_filter_gzip.c",
            "archive_write_add_filter_lrzip.c",
            "archive_write_add_filter_lz4.c",
            "archive_write_add_filter_lzop.c",
            "archive_write_add_filter_none.c",
            "archive_write_add_filter_program.c",
            "archive_write_add_filter_uuencode.c",
            "archive_write_add_filter_xz.c",
            "archive_write_add_filter_zstd.c",
            "archive_write_set_format.c",
            "archive_write_set_format_7zip.c",
            "archive_write_set_format_ar.c",
            "archive_write_set_format_by_name.c",
            "archive_write_set_format_cpio.c",
            "archive_write_set_format_cpio_binary.c",
            "archive_write_set_format_cpio_newc.c",
            "archive_write_set_format_cpio_odc.c",
            "archive_write_set_format_filter_by_ext.c",
            "archive_write_set_format_gnutar.c",
            "archive_write_set_format_iso9660.c",
            "archive_write_set_format_mtree.c",
            "archive_write_set_format_pax.c",
            "archive_write_set_format_raw.c",
            "archive_write_set_format_shar.c",
            "archive_write_set_format_ustar.c",
            "archive_write_set_format_v7tar.c",
            "archive_write_set_format_warc.c",
            "archive_write_set_format_xar.c",
            "archive_write_set_format_zip.c",
            "archive_write_set_options.c",
            "archive_write_set_passphrase.c",
            "filter_fork_posix.c",
            "xxhash.c",
        },
    });
    b.installArtifact(lib);
}
